import 'package:flutter/widgets.dart';

class Responsive {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 500;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1200 &&
      MediaQuery.of(context).size.width >= 500;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;
}
