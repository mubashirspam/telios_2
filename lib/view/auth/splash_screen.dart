import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:shimmer/shimmer.dart';
import '../../settings/route/app_router.dart';
import '../../settings/theme/colors.dart';
import '../../view_model/auth/auth_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      debugPrint('Starting splash screen initialization');
      await _initializeApp();
    });
  }

  Future<void> _initializeApp() async {
    final authController = Get.find<AuthController>();
    
    debugPrint('Checking login status from splash screen');
    await authController.checkLoginStatus();
    debugPrint('Login check complete, isLoggedIn: ${authController.isLoggedIn}');

    // Clear local DB if trapdor
    if (authController.isTrapdor) {
      debugPrint('User is trapdor, clearing local DB');
      await authController.clearLocalDB();
    }

    // Let the router handle navigation
    if (context.mounted) {
      debugPrint('Navigating based on auth state: ${authController.isLoggedIn}');
      if (authController.isLoggedIn) {
        appRouter.go(ScreenPaths.home(tabIndex: 0));
      } else {
      appRouter.go(ScreenPaths.login);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backround,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 150,
              width: 150,
            ),
            const SizedBox(height: 20),
            Shimmer.fromColors(
              baseColor: AppColor.primary,
              highlightColor: AppColor.textSecondary,
              child: const Text(
                'Loading...',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
