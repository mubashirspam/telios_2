import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telios_2/model/model.dart';
import 'package:telios_2/view_model/view_model.dart';

import '../../settings/settings.dart';

class AuthController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();

  final _levelService = Get.find<LevelService>();
  final _surveyService = Get.find<SurveyService>();

  ApiResponse<LoginModel> response = ApiResponse.initial();
  ApiResponse<UserData> userResponse = ApiResponse.initial();
  bool isPasswordVisible = false;
  
  final _isLoggedIn = false.obs;
  final _userId = ''.obs;
  final _isTrapdor = false.obs;
  final _isAdvancedUser = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    initializeAuth();
    // Listen to auth service changes
    ever(_authService.authed, (bool authed) {
      debugPrint('Auth state changed: $authed');
      _isLoggedIn.value = authed;
      _updateRouterAuthState();
      update();
    });
    
    ever(_authService.userId, (String id) {
      debugPrint('User ID changed: $id');
      _userId.value = id;
      update();
    });
    
    ever(_authService.isTrapdor, (bool trapdor) {
      debugPrint('Trapdor state changed: $trapdor');
      _isTrapdor.value = trapdor;
      update();
    });
    
    ever(_authService.isAdvancedUser, (bool advanced) {
      debugPrint('Advanced user state changed: $advanced');
      _isAdvancedUser.value = advanced;
      update();
    });
  }

  void _updateRouterAuthState() {
    debugPrint('Updating router auth state: ${_isLoggedIn.value}');
    _isLoggedIn.value = _isLoggedIn.value;
  }

  Future<void> initializeAuth() async {
    debugPrint('Initializing auth...');
    await checkLoginStatus();
   
    debugPrint('Auth initialized. Logged in: ${_isLoggedIn.value}');
    _updateRouterAuthState();
    update();
  }

  bool get isTrapdor => _isTrapdor.value;
  String get userId => _userId.value;
  bool get isAdvancedUser => _isAdvancedUser.value;
  bool get isLoggedIn => _isLoggedIn.value;

  Future<void> checkLoginStatus() async {
    debugPrint('Checking login status...');
    final isLoggedIn = await _authService.checkLoginStatus();
    debugPrint('Login status: $isLoggedIn');
    _isLoggedIn.value = isLoggedIn;
    _updateRouterAuthState();
    update();
  }

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

  Future<void> clearLocalDB() async {
    await _levelService.clearLevelsDB();
    await _surveyService.clearSurveyDB();
    update();
  }

  Future<void> refreshToken() async {
    await _authService.refreshTokenIfNeeded();
    update();
  }

  void logout() {
    _authService.logout();
    // Get.offAllNamed(
    //     RouterName.login);
    appRouter.go(ScreenPaths.login);

    // Navigate to login screen if not logged in
    update();
  }

  Future<void> fetchUser() async {
    if (userResponse.state == ResponseState.completed ||
        userResponse.state == ResponseState.loading) {
      return;
    }
    userResponse = ApiResponse.loading();

    final currentUserId = _authService.userId.value;
    if (currentUserId.isEmpty) {
      await checkLoginStatus();
      if (!isLoggedIn) {
        logout();
        return;
      }
    }

    update();

    final localResult =
        await _authService.fetchUser(userId: _authService.userId.value, isRemote: false);

    localResult.fold(
      (failure) async {
        final remoteResult =
            await _authService.fetchUser(userId: _authService.userId.value, isRemote: true);
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
        _authService.fetchUser(userId: _authService.userId.value, isRemote: true);
      },
    );
  }
}
