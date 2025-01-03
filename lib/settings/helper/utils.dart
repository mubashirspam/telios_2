import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DebouncerFun {
  DebouncerFun({this.milliseconds = 400});
  final int milliseconds;
  Timer? _timer;

  run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

class AppHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

showSnackBar(String tittle, String subtitle) {
  return Get.snackbar(
    tittle,
    subtitle,
    snackPosition: SnackPosition.BOTTOM,
    duration: const Duration(milliseconds: 800),
    animationDuration: const Duration(milliseconds: 200),
  );
}

// final Map<int, ColorMap> categoryColorMap = {
//   21: ColorMap(color: AppColor.hc, name: "Green"),
//   22: ColorMap(color: AppColor.mc, name: "Red"),
//   20: ColorMap(color: AppColor.pc, name: "Blue"),
//   27: ColorMap(color: AppColor.av, name: "Yellow"),
//   1: ColorMap(color: Colors.white, name: ""),
//   0: ColorMap(color: Colors.grey.shade300, name: "Empty"),
// };

class ColorMap {
  Color? color;
  String name;
  ColorMap({
    required this.color,
    required this.name,
  });
}

// final Map<int, int> categoryMap = {
//   21: 21,
//   20: 20,
//   22: 22,
//   27: 27,
//   28: 28,
//   0: 0,
// };
