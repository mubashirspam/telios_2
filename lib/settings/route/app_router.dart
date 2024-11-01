import 'package:get/get.dart';
import '../../view/view.dart';
import '../../view_model/view_model.dart';

class AppRoute {
  static const String initialRoute = RouterName.splash;
  static final getRouter = [
    GetPage(
      name: RouterName.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: RouterName.login,
      page: () => LoginScreen(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: RouterName.home,
      page: () => const HomeScreen(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(name: RouterName.otp, page: () => const OtpScreen()),
    GetPage(
      name: RouterName.assignedLevel,
      page: () => const AssignedLevelScreen(),
    ),
    GetPage(
      name: RouterName.mapLevel,
      page: () => MapLevelScreen(
        assignedLevel: Get.arguments,
      ),
    ),
    GetPage(
      name: RouterName.surveyLevel,
      page: () => SurveyLevelHome(
        mapLevel: Get.arguments,
      ),
    ),
  ];
}

class RouterName {
  static const String splash = '/splash';
  static const String form = '/form';
  static const String login = '/login';
  static const String otp = '/otp';
  static const String home = '/home';
  static const String pendingSurvey = '/pending-survey';
  static const String assignedLevel = '/assigned-level';
  static const String mapLevel = '/map-level';
  static const String surveyLevel = '/survey-level';
}
