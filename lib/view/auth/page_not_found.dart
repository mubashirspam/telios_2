import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../settings/route/app_router.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound( {super.key});



  @override
  Widget build(BuildContext context) {
    void handleHomePressed() => context.go(ScreenPaths.home(tabIndex: 0));
    final style = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: color.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                "assets/images/logo.png",
                width: 150,
                height: 150,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Rutu Bhonsle',
              style: style.titleLarge!.copyWith(color: color.primary),
            ),
            const SizedBox(height: 70),
            Text(
              "The page you are looking for does not exist.",
              style: style.bodyMedium,
            ),
            const SizedBox(height: 70),
            ElevatedButton(
              onPressed: handleHomePressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: color.primary,
                foregroundColor: color.onPrimary,
                minimumSize: const Size(double.maxFinite, 50),
              ),
              child: Text(
                "Back to Home",
                style: style.titleMedium,
              ),
            )
          ],
        ),
      ),
    );
  }
}
