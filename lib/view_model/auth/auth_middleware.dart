

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:telios_2/settings/route/app_router.dart';

import 'auth_controller.dart';
class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final authController = Get.find<AuthController>();

    // Allow the splash screen to load initially
    if (route == RouterName.splash) return null;

    // If not logged in and trying to access a protected route, redirect to login
    if (!authController.isLoggedIn && route != RouterName.login) {
      return RouteSettings(name: RouterName.login);
    }

    // If logged in and trying to access login, redirect to home
    if (authController.isLoggedIn && route == RouterName.login) {
      return RouteSettings(name: RouterName.home);
    }

    // Allow the requested route for all other cases
    return null;
  }
}



