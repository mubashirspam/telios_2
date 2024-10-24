import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:telios_2/view_model/survey/survey_service.dart';
import '../../model/isar/isar.dart';
import '../../view_model/view_model.dart';
import 'constants.dart';

late final SharedPreferences prefs;

Future<void> getDiInit() async {
  Get.put(AuthService());
  Get.put(SurveyService());
  Get.put(SurveyController());
  Get.put(LevelService());
  Get.put(AuthController());
  Get.put(LevelController());
}

Future<void> dbInit() async {
  try {
    if (!kIsWeb) {
      Future<Directory?>? dir;
      dir = getApplicationSupportDirectory();
      final Directory? directory = await dir;

      await Isar.open(
        name: db,
        [
          IsarUserSchema,
          IsarAssignedLevelSchema,
          IsarMapLevelModelSchema,
          IsarSurveyLevelModelSchema,
          IsarSurveyQusetionModelSchema,
          IsarSurveyAnswerModelSchema,
          IsarSurveyTempSchema,
          IsarMultiDropdownOptionModelSchema
          
        ],
        directory: '${directory?.path}',
      );
    }
  } catch (e) {
    log(e.toString());
  }
}
