import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../model/model.dart';
import '../../view/auth/page_not_found.dart';
import '../../view/home/app_scaffold.dart';
import '../../view/view.dart';
import '../../view_model/view_model.dart';



class ScreenPaths {
  static const String splash = '/';
  static const String login = '/login';
  static const String otp = '/otp';

  static String home({required int tabIndex}) => '/home?t=$tabIndex';

  static String map(String? id) => _appendToCurrentPath('map?id=${id ?? ''}');
  static String survey(String? id) =>
      _appendToCurrentPath('survey?id=${id ?? ''}');

  static String _appendToCurrentPath(String newPath) {
    final newPathUri = Uri.parse(newPath);
    final currentUri = appRouter.routeInformationProvider.value.uri;
    Map<String, dynamic> params = Map.of(currentUri.queryParameters);
    params.addAll(newPathUri.queryParameters);
    Uri? loc = Uri(
        path: '${currentUri.path}/${newPathUri.path}'.replaceAll('//', '/'),
        queryParameters: params);
    return loc.toString();
  }
}

final appRouter = GoRouter(
  redirect: _handleRedirect,
  errorPageBuilder: (context, state) => MaterialPage(child: PageNotFound()),
  routes: [
    ShellRoute(
      builder: (context, router, navigator) {
          return AppScaffold(child: navigator);
      },
      routes: [
        AppRoute(ScreenPaths.splash, (_) => const SplashScreen()),
        AppRoute(ScreenPaths.login, (_) => LoginScreen()),
        AppRoute(ScreenPaths.otp, (_) => const OtpScreen()),
        AppRoute(
          '/home',
          (s) {
            int tab = int.tryParse(s.uri.queryParameters['t'] ?? '') ?? 0;
            return HomeScreen(tabIndex: tab);
          },
          useFade: true,
          routes: [
            AppRoute(
              'map',
              (s) {
                final levelController = Get.find<LevelController>();
                final assignedLevel = levelController.getAssignedLevelByKey(s.uri.queryParameters['id']!);
                return MapLevelScreen(
                  id: s.uri.queryParameters['id']!,
                  assignedLevel: assignedLevel,
                );
              },
              useFade: true,
              routes: [
                AppRoute(
                  'survey',
                  (s) {
                    final levelController = Get.find<LevelController>();
                    final mapLevel = levelController.getMapLevelByKey(s.uri.queryParameters['id']!);
                    return SurveyLevelHome(
                      id: s.uri.queryParameters['id']!,
                      mapLevel: mapLevel,
                    );
                  },
                  useFade: true,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);

class AppRoute extends GoRoute {
  AppRoute(String path, Widget Function(GoRouterState s) builder,
      {List<GoRoute> routes = const [], this.useFade = false})
      : super(
          path: path,
          routes: routes,
          pageBuilder: (context, state) {
            final pageContent = Scaffold(
              body: builder(state),
              resizeToAvoidBottomInset: false,
            );
            if (useFade) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: pageContent,
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              );
            }
            return CupertinoPage(child: pageContent);
          },
        );
  final bool useFade;
}

String? get initialDeeplink => _initialDeeplink;
String? _initialDeeplink;

String? _handleRedirect(BuildContext context, GoRouterState state) {
  final authController = Get.find<AuthController>();

  final bool isUserSignedIn = authController.isLoggedIn;
  debugPrint('isUserSignedIn: $isUserSignedIn');
  debugPrint('state.uri.path: ${state.uri.path}');

  if (state.uri.path != ScreenPaths.login && !isUserSignedIn) {
    debugPrint('Redirecting from ${state.uri.path} to ${ScreenPaths.login}.');
    _initialDeeplink ??= state.uri.toString();
    return ScreenPaths.login;
  }

  if (isUserSignedIn &&
      (state.uri.path == ScreenPaths.login ||
          state.uri.path == ScreenPaths.splash)) {
    debugPrint('Redirecting from ${state.uri.path} to ${ScreenPaths.home}');
    return ScreenPaths.home(tabIndex: 0);
  }

  return null; // do nothing
}
