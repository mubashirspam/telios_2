import 'package:get/get.dart';
import 'package:telios_2/model/model.dart';

import '../../settings/settings.dart';
import 'auth_service.dart';

class AuthController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();
  ApiResponse<LoginModel> response = ApiResponse.initial();
  ApiResponse<UserData> userResponse = ApiResponse.initial();
  bool isPasswordVisible = false;

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  @override
  void onInit() {
    checkLoginStatus();
    refreshToken();
    super.onInit();
  }

  bool get isTrapdor => _authService.isTrapdor.value;
  String get userId => _authService.userId.value;
  bool get isAdvancedUser => _authService.isAdvancedUser.value;
  bool get isLoggedIn => _authService.authed.value;

  Future<void> login(String phoneNumber, String password) async {
    userResponse = ApiResponse.initial();
    response = ApiResponse.loading();

    update();
    final r = await _authService.login(phoneNumber, password);
    r.fold(
      (l) {
        response = ApiResponse.error(l);
        update();
      },
      (r) {
        response = ApiResponse.completed(r);
        update();
      },
    );
  }

  Future<void> checkLoginStatus() async {
    await _authService.checkLoginStatus();
    update();
  }

  Future<void> refreshToken() async {
    await _authService.refreshTokenIfNeeded();
    update();
  }

  void logout() {
    _authService.logout();
    Get.offAllNamed(
        RouterName.login); // Navigate to login screen if not logged in
    update();
  }

  Future<void> fetchUser() async {
    if (userResponse.state == ResponseState.completed ||
        userResponse.state == ResponseState.loading) {
      return;
    }
    userResponse = ApiResponse.loading();

    if (userId == '') {
      logout();
      return;
    }

    update();

    final localResult =
        await _authService.fetchUser(userId: userId, isRemote: false);

    localResult.fold(
      (failure) async {
        final remoteResult =
            await _authService.fetchUser(userId: userId, isRemote: true);
        remoteResult.fold(
          (remoteFailure) {
            userResponse = ApiResponse.error(remoteFailure);
            update();
          },
          (remoteUserModel) {
            userResponse = ApiResponse.completed(remoteUserModel);

            update();
          },
        );
      },
      (localUserModel) async {
        userResponse = ApiResponse.completed(localUserModel);

        update();
        _authService.fetchUser(userId: userId, isRemote: true);
      },
    );
  }
}
