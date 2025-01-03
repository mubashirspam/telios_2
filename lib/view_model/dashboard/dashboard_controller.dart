import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telios_2/model/model.dart';
import 'package:telios_2/view_model/dashboard/dashboard_service.dart';

import '../survey/survey_controller.dart';

class DashboardController extends GetxController {
  final _service = DashboardService.instance;

  // Dashboard data
  final RxMap<String, dynamic> dashboardStats = <String, dynamic>{}.obs;

  @override
  void onInit() {
    super.onInit();
    fetchDashboardStats();
  }

  Future<void> fetchDashboardStats() async {
    try {
      // Fetch all data from local DB
      final assignedLevelsResult = await _service.getAssignedLevels();
      final mapLevelsResult = await _service.getMapLevels();
      final surveyLevelsResult = await _service.getSurveyLevels();
      final surveyAnswersResult = await _service.getSurveyAnswers();
    
      RxList<SurveyCategory> categoryMap =
          Get.find<SurveyController>().categoryList;
      // Extract data from Either results
      final allAssignedLevels =
          assignedLevelsResult.fold((l) => <LevelInfo>[], (r) => r);
      final allMapLevels = mapLevelsResult.fold((l) => <LevelInfo>[], (r) => r);
      final allSurveyLevels =
          surveyLevelsResult.fold((l) => <LevelInfo>[], (r) => r);
      final allSurveyAnswers =
          surveyAnswersResult.fold((l) => <SurveyAnswerModel>[], (r) => r);


      // Calculate counts
      final assignedLevelCount = allAssignedLevels.length;
      final mapLevelCount = allMapLevels.length;
      final surveyLevelCount = allSurveyLevels.length;
      final surveyedCount = allSurveyAnswers.length;
      final notSurveyedCount = surveyLevelCount - surveyedCount;

      // Calculate category distribution for answered surveys
      Map<int, int> categoryList = {};
      Map<int, double> categoryPercentages = {};
      int totalCountInCategories = 0;

      // Count surveys by category from answers
      for (var answer in allSurveyAnswers) {
        if (answer.sCategory != null) {
          categoryList[answer.sCategory!] =
              (categoryList[answer.sCategory!] ?? 0) + 1;
          totalCountInCategories++;
        }
      }

            log('Total categorized surveys: $categoryMap');

      // Calculate percentages for each category
      for (var category in categoryMap) {
        final questionId = category.questionId ?? 0;
        final count = categoryList[questionId] ?? 0;
        categoryPercentages[questionId] =
            surveyedCount > 0 ? (count / surveyedCount) * 100 : 0;
      }

      // Handle uncategorized surveys
      final uncategorizedCount = surveyedCount - totalCountInCategories;
      if (uncategorizedCount > 0) {
        categoryList[0] = uncategorizedCount;
        categoryPercentages[0] =
            surveyedCount > 0 ? (uncategorizedCount / surveyedCount) * 100 : 0;
      }

      // Update dashboard stats
      dashboardStats.value = {
        'assignedLevelCount': assignedLevelCount,
        'mapLevelCount': mapLevelCount,
        'surveyLevelCount': surveyLevelCount,
        'surveyedCount': surveyedCount,
        'notSurveyedCount': notSurveyedCount,
        'categoryList': categoryList,
        'categoryPercentages': categoryPercentages,
        'totalCategorizedSurveys': totalCountInCategories,
        'categories': categoryMap,
      };

      update();
    } catch (e) {
      debugPrint('Error fetching dashboard stats: $e');
      dashboardStats.value = {
        'assignedLevelCount': 0,
        'mapLevelCount': 0,
        'surveyLevelCount': 0,
        'surveyedCount': 0,
        'notSurveyedCount': 0,
        'categoryList': <int, int>{},
        'categoryPercentages': <int, double>{},
        'totalCategorizedSurveys': 0,
        'categories': <SurveyCategory>[],
      };
      update();
    }
  }

  // Get stats by level key
  Future<Map<String, dynamic>> getStatsByLevelKey(String levelKey) async {
    try {
      final surveyAnswersResult = await _service.getSurveyAnswers();
      

      final answers =
          surveyAnswersResult.fold((l) => <SurveyAnswerModel>[], (r) => r);


      RxList<SurveyCategory> categoryMap =
          Get.find<SurveyController>().categoryList;

      // Filter answers for this level
      final levelAnswers =
          answers.where((a) => a.surveyLevelKey == levelKey).toList();

      // Calculate category distribution for this level
      Map<int, int> categoryList = {};
      Map<int, double> categoryPercentages = {};
      int totalCategorizedSurveys = 0;

      for (var answer in levelAnswers) {
        final category = answer.sCategory;
        if (category != null) {
          categoryList[category] = (categoryList[category] ?? 0) + 1;
          totalCategorizedSurveys++;
        }
      }

      log('Total categorized surveys: $categoryMap');

      for (var category in categoryMap) {
        int count = categoryList[category.questionId ?? 0] ?? 0;
        categoryPercentages[category.questionId ?? 0] =
            totalCategorizedSurveys > 0
                ? (count / totalCategorizedSurveys) * 100
                : 0;
      }

      return {
        'totalSurveys': levelAnswers.length,
        'categoryList': categoryList,
        'categoryPercentages': categoryPercentages,
        'totalCategorizedSurveys': totalCategorizedSurveys,
      };
    } catch (e) {
      debugPrint('Error getting stats for level $levelKey: $e');
      return {
        'totalSurveys': 0,
        'categoryList': <int, int>{},
        'categoryPercentages': <int, double>{},
        'totalCategorizedSurveys': 0,
      };
    }
  }
}
