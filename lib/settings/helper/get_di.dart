import 'dart:developer';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import '../../model/hive/isar.dart';
import '../../view_model/view_model.dart';

// late final SharedPreferences prefs;

Future<void> getDiInit() async {
  Get.put(AuthService());
  Get.put(SurveyService());
  Get.put(SurveyController());
  Get.put(LevelService());
  Get.put(AuthController());
  Get.put(LevelController());
  await Future.delayed(const Duration(seconds: 1));
}

Future<void> dbInit() async {
  try {
    await Hive.initFlutter();
    Hive.registerAdapter(HiveUserAdapter());
    Hive.registerAdapter(HiveAssignedLevelAdapter());
    Hive.registerAdapter(HiveMultiDropdownOptionModelAdapter());
    Hive.registerAdapter(HiveChildOptionAdapter());
    Hive.registerAdapter(HiveMapLevelModelAdapter());
    Hive.registerAdapter(HiveMapLevelAdapter());
    Hive.registerAdapter(HiveSurveyAnswerModelAdapter());
    Hive.registerAdapter(HiveAnswerAdapter());
    Hive.registerAdapter(HiveDItemAdapter());
    Hive.registerAdapter(HiveSurveyLevelModelAdapter());
    Hive.registerAdapter(HiveSurveyLevelAdapter());
    Hive.registerAdapter(HiveSurveyQuestionModelAdapter());
    Hive.registerAdapter(HiveSurveyQuestionAdapter());
    Hive.registerAdapter(HiveSurveyCategoryAdapter());
    Hive.registerAdapter(HiveSurveyTempAdapter());
    Hive.registerAdapter(HiveSurveyTempAnswersAdapter());
    Hive.registerAdapter(HiveDItemTempAdapter());

    await Hive.openBox<HiveUser>(HiveBoxes.users);
    await Hive.openBox<HiveAssignedLevel>(HiveBoxes.assignedLevels);
    await Hive.openBox<HiveMultiDropdownOptionModel>(
        HiveBoxes.multiDropdownOptions);
    await Hive.openBox<HiveMapLevelModel>(HiveBoxes.mapLevels);
    await Hive.openBox<HiveSurveyAnswerModel>(HiveBoxes.surveyAnswers);
    await Hive.openBox<HiveSurveyLevelModel>(HiveBoxes.surveyLevels);
    await Hive.openBox<HiveSurveyQuestionModel>(HiveBoxes.surveyQuestions);
    await Hive.openBox<HiveSurveyTemp>(HiveBoxes.surveyTemp);

    log("Hive initialized successfully");
  } catch (e) {
    log('Failed to initialize Hive: $e');
  }
}

class HiveBoxes {
  static const String users = 'users';
  static const String assignedLevels = 'assigned_levels';
  static const String mapLevels = 'map_levels';
  static const String surveyLevels = 'survey_levels';
  static const String surveyQuestions = 'survey_questions';
  static const String surveyAnswers = 'survey_answers';
  static const String surveyTemp = 'survey_temp';
  static const String multiDropdownOptions = 'multi_dropdown_options';
}
