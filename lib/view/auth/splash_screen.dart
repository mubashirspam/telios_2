import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final authController = Get.find<AuthController>();
    await authController.checkLoginStatus();

    // Add a small delay to allow for a smooth transition
    await Future.delayed(const Duration(seconds: 1));

    if (authController.isLoggedIn) {
      Get.offNamed(RouterName.home);
    } else {
      Get.offNamed(RouterName.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  "assets/images/logo.png",
                  width: 150,
                  height: 150,
                ),
              ),
              const SizedBox(height: 15),
              SvgPicture.asset(
                "assets/images/logo_typ.svg",
                height: 25,
              )
            ],
          ),
        ),
        SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade200.withOpacity(0.1),
            highlightColor: AppColor.primary.withOpacity(0.1),
            child: const SizedBox(
              child: ColoredBox(color: Colors.white),
            ),
          ),
        ),
      ],
    ));
  }
}
