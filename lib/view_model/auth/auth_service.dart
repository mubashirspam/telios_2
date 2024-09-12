import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:telios_2/settings/settings.dart';
import '../../model/model.dart';
import '../../settings/helper/refresh_token.dart';
import 'auth_repository.dart';

class AuthService extends GetxService {
  final authRepo = AuthRepository();
  final authed = false.obs;
  final isTrapdor = false.obs;
  final isAdvancedUser = false.obs;
  final RxString currentToken = ''.obs;
  final RxString userId = ''.obs;

  Future<void> initializeToken() async {
    const duration = Duration(minutes: 13);
    final tokenResponse = await authRepo.initializeToken();
    tokenResponse.fold(
      (failure) => Get.snackbar('Error', failure.message),
      (initializeModel) async {
        currentToken.value = initializeModel.response!.token!;
        await authRepo.saveToken(currentToken.value);
        await authRepo.saveTokenExpiration(DateTime.now().add(duration));
      },
    );
  }

  Future<void> refreshTokenIfNeeded() async {
    final token = await authRepo.getToken();
    final isExpired = await authRepo.isTokenExpired();
    if (token == null || token.isEmpty || isExpired) {
      await initializeToken();
    } else {
      currentToken.value = token;
    }
  }

  Future<bool> checkLoginStatus() async {
    final isLoggedIn = await authRepo.isLoggedIn();
    if (isLoggedIn) {
      final id = await authRepo.getUserId();
      if (id != null) {
        userId.value = id;
        authed.value = true;
        isTrapdor.value = await authRepo.isTrapdor();
        isAdvancedUser.value = await authRepo.isAdvancedUser();

        return true;
      }
    }
    return false;
  }

  Future<Either<MainFailure, LoginModel>> login(
    String phoneNumber,
    String password,
  ) async {
    await refreshTokenIfNeeded();
    return executeWithTokenRefresh(
      () => authRepo
          .login(
            phoneNumber: phoneNumber,
            password: password,
            token: currentToken.value,
          )
          .then(
            (result) => result.fold(
              (failure) {
                Get.snackbar('Error', failure.message);
                return Left(failure);
              },
              (loginModel) async {
                final loginDetails = loginModel.response!.data!.first.fieldData;
                if (loginDetails != null) {
                  authed.value = true;
                  final bool isTrapdorValue = loginDetails.message == "alert";
                  // final bool isAdvancedUserValue = loginDetails.isAdvancedUser ?? false;
                  await authRepo.saveUserId(loginDetails.userId!);
                  await authRepo.setTrapdor(isTrapdorValue);
                  // await authRepo.setAdvancedUser(isAdvancedUserValue);
                  isTrapdor.value = isTrapdorValue;
                  // isAdvancedUser.value = isAdvancedUserValue;
                  Get.offAllNamed(RouterName.splash);
                }
                return Right(loginModel);
              },
            ),
          ),
    );
  }

  Future<Either<MainFailure, UserData>> fetchUser({
    required String userId,
    required bool isRemote,
  }) async {
    if (isRemote) {
      await refreshTokenIfNeeded();
      return executeWithTokenRefresh(
        () => authRepo
            .fetchUserRemote(
              userId: userId,
              token: currentToken.value,
            )
            .then(
              (result) => result.fold(
                (failure) {
                  Get.snackbar('Error', failure.message);
                  return Left(failure);
                },
                (userModel) async {
                  final UserData userData =
                      userModel.response!.user!.first.userData!;
                  await authRepo.postUserDB(userData);
                  return Right(userData);
                },
              ),
            ),
      );
    } else {
      try {
        final localUserData = await authRepo.fetchUserDB(userId);
        if (localUserData != null) {
          return Right(localUserData);
        } else {
          return Left(MainFailure(message: 'User not found in local database'));
        }
      } catch (e) {
        return Left(MainFailure(
            message:
                'Error fetching user from local database: ${e.toString()}'));
      }
    }
  }

  Future<void> logout() async {
    await authRepo.clearUserId();
    await authRepo.clearUserDB(userId.value);
    await authRepo.logOutToken(currentToken.value);
    authed.value = false;
    Get.offAllNamed('/login');
  }
}
