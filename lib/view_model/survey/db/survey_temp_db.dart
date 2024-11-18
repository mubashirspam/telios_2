import 'dart:developer';
import 'package:hive/hive.dart';

import '../../../model/model.dart';
import '../../../settings/helper/get_di.dart';


class SurveyTempDB {
  SurveyTempDB._();
  static final instance = SurveyTempDB._();
  

    final tempBox = Hive.box<HiveSurveyTemp>(HiveBoxes.surveyTemp);

  Future<void> postSurveyTempDB(SurveyTemp data) async {
    String key = '${data.assignedLevelKey}_${data.surveyLevelKey}_${data.geoJsonLevelKey}';
    
    final existingData = tempBox.get(key);

    if (existingData == null) {
      final newLevel = HiveSurveyTemp()
        ..assignedLevelKey = data.assignedLevelKey
        ..surveyLevelKey = data.surveyLevelKey
        ..assignedLevelName = data.assignedLevelName
        ..surveyLevelName = data.surveyLevelName
        ..geoJsonLevelKey = data.geoJsonLevelKey
        ..geoJsonLevelName = data.geoJsonLevelName
        ..answers = data.answers?.map((answer) {
          return HiveSurveyTempAnswers()
            ..surveyId = answer.surveyId
            ..answer = answer.answer
            ..answerOptions = answer.answerOptions
                ?.map((v) => HiveDItemTemp()
                  ..id = v.id
                  ..name = v.name)
                .toList()
            ..questionId = answer.questionId
            ..typeId = answer.typeId
            ..question = answer.question;
        }).toList();

      await tempBox.put(key, newLevel);
    } else {
      existingData.answers = data.answers?.map((answer) {
        return HiveSurveyTempAnswers()
          ..surveyId = answer.surveyId
          ..answer = answer.answer
          ..answerOptions = answer.answerOptions
              ?.map((v) => HiveDItemTemp()
                ..id = v.id
                ..name = v.name)
              .toList()
          ..questionId = answer.questionId
          ..typeId = answer.typeId
          ..question = answer.question;
      }).toList();

      await tempBox.put(key, existingData);
    }
  }

  Future<List<SurveyTemp>?> fetchSurveyTempDB() async {
    try {
      final data = tempBox.values.toList();
      
      if (data.isNotEmpty) {
        return data.map((hive) {
          return SurveyTemp(
            assignedLevelKey: hive.assignedLevelKey!,
            surveyLevelKey: hive.surveyLevelKey!,
            assignedLevelName: hive.assignedLevelName!,
            surveyLevelName: hive.surveyLevelName!,
            geoJsonLevelKey: hive.geoJsonLevelKey,
            geoJsonLevelName: hive.geoJsonLevelName,
            answers: hive.answers?.map((hive) {
              return SurveyTempAnswers(
                surveyId: hive.surveyId!,
                answer: hive.answer!,
                answerOptions: hive.answerOptions
                    ?.map((v) => DItem(v.name ?? '', v.id ?? 0))
                    .toList(),
                questionId: hive.questionId!,
                typeId: hive.typeId!,
                question: hive.question!,
              );
            }).toList()
          );
        }).toList();
      }
      return [];
    } catch (error) {
      log('Error fetching data: $error');
      return [];
    }
  }

  Future<bool> clearSurveyTempDB() async {
    try {
      await tempBox.clear();
      return true;
    } catch (error) {
      log('Error deleting data: $error');
      return false;
    }
  }
}