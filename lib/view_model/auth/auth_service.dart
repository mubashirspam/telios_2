import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:telios_2/settings/settings.dart';
import '../../model/model.dart';
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
    try {
      final tokenResponse = await authRepo.initializeToken();
      currentToken.value = tokenResponse.response!.token!;
      await authRepo.saveToken(currentToken.value);
      await authRepo.saveTokenExpiration(DateTime.now().add(duration));
    } catch (e) {
      debugPrint('Error initializing token: $e');
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> refreshTokenIfNeeded() async {
    final token = await authRepo.getToken();
    final isExpired = await authRepo.isTokenExpired();
    debugPrint('Current token: $token, isExpired: $isExpired');
    if (token == null || token.isEmpty || isExpired) {
      await initializeToken();
    } else {
      currentToken.value = token;
    }
  }

  Future<bool> checkLoginStatus() async {
    debugPrint('Checking login status...');
    final isLoggedIn = await authRepo.isLoggedIn();
    debugPrint('Is logged in from storage: $isLoggedIn');
    
    if (isLoggedIn) {
      final id = await authRepo.getUserId();
      debugPrint('User ID from storage: $id');
      
      if (id != null && id.isNotEmpty) {
        userId.value = id;
        authed.value = true;

        isTrapdor.value = await authRepo.isTrapdor();
        isAdvancedUser.value = await authRepo.isAdvancedUser();
        debugPrint('Auth state set to true, userId: $id');
        return true;
      }
    }
    
    debugPrint('Auth state set to false');
    authed.value = false;
    return false;
  }

  Future<Either<MainFailure, LoginModel>> login(
      String phoneNumber, String password) async {
    try {
      await refreshTokenIfNeeded();
      final response = await executeWithTokenRefresh(() => authRepo.login(
          phoneNumber: phoneNumber,
          password: password,
          token: currentToken.value));

      return response.fold(
        (failure) => Left(failure),
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
            // Get.offAllNamed(RouterName.splash);
            appRouter.go(ScreenPaths.splash);
          }
          return Right(loginModel);
        },
      );
    } on DioException catch (e) {
      showSnackbar('Error on login', e.toString());
      return Left(MainFailure(message: e.toString()));
    }
  }

  Future<Either<MainFailure, UserData>> fetchUser({
    required String userId,
    required bool isRemote,
  }) async {
    if (isRemote) {
      try {
        await refreshTokenIfNeeded();
        final response = await executeWithTokenRefresh(() => authRepo
            .fetchUserRemote(userId: userId, token: currentToken.value));

        return response.fold(
          (failure) => Left(failure),
          (userModel) async {
            try {
              final UserData userData =
                  userModel.response!.user!.first.userData!;
              await authRepo.postUserDB(userData);
              return Right(userData);
            } catch (e) {
              return Left(MainFailure(message: e.toString()));
            }
          },
        );
      } catch (e) {
        showSnackbar('Error on user loading', e.toString());
        return Left(MainFailure(message: e.toString()));
      }
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
