import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/colors.dart';


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

final Map<String, Color> categoryColorMap = {
  'hc': AppColor.hc,
  'pc': AppColor.pc,
  'mc': AppColor.mc,
  'av': AppColor.av,
  'Empty': Colors.grey.shade300,
  '': Colors.white, // Default color if no match
};


final Map<String, String> categoryMap = {
  'hc': 'hc',
  'pc': 'pc',
  'mc': 'mc',
  'av': 'av',
  'Empty': 'Empty',
  
};
