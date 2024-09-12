

import 'package:flutter/material.dart';
import 'package:get/get.dart';




class LocalizationController extends GetxController  {
  // final prefs = SharedPreferences.getInstance();
  
  Rx<String?> selectedLanguage = ''.obs;

  @override
  void onInit() {
    selectedLanguage.value = Get.deviceLocale.toString();
    super.onInit();
  }

  void changeLanguage(String lang) {
    Locale locale = Locale(lang);
    Get.updateLocale(locale);
    selectedLanguage.value = lang;
  }
}
