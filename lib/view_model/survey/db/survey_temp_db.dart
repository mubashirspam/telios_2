import 'dart:developer';
import 'package:isar/isar.dart';
import 'package:telios_2/model/model.dart';
import '../../../settings/settings.dart';

class SurveyTempDB {
  SurveyTempDB._();
  static final instance = SurveyTempDB._();
  Future<void> postSurveyTempDB(SurveyTemp data) async {
    final isar = Isar.getInstance(db);
    final collection = isar?.collection<IsarSurveyTemp>();
    final existingData = await collection
        ?.where()
        .filter()
        .assignedLevelKeyEqualTo(data.assignedLevelKey)
        .and()
        .surveyLevelKeyEqualTo(data.surveyLevelKey)
        .findFirst();
    if (existingData == null) {
      await isar?.writeTxn(() async {
        final newLevel = IsarSurveyTemp()
          ..assignedLevelKey = data.assignedLevelKey
          ..surveyLevelKey = data.surveyLevelKey
          ..assignedLevelName = data.assignedLevelName
          ..surveyLevelName = data.surveyLevelName
          ..answers = data.answers?.map((answer) {
            return IsarSurveyTempAnswers()
              ..surveyId = answer.surveyId
              ..answer = answer.answer
              ..answerOptions = answer.answerOptions
              ..questionId = answer.questionId
              ..typeId = answer.typeId
              ..question = answer.question;
          }).toList();
        await collection?.put(newLevel);
      });
    } else {
      await isar?.writeTxn(() async {
        existingData.answers = data.answers?.map((answer) {
          return IsarSurveyTempAnswers()
            ..surveyId = answer.surveyId
            ..answer = answer.answer
            ..answerOptions = answer.answerOptions
            ..questionId = answer.questionId
            ..typeId = answer.typeId
            ..question = answer.question;
        }).toList();
        await collection?.put(existingData);
      });
    }
  }

  Future<List<SurveyTemp>?> fetchSurveyTempDB() async {
    final isar = Isar.getInstance(db);
    final collection = isar?.collection<IsarSurveyTemp>();
    final data = await collection?.where().findAll();
    List<SurveyTemp> list = [];
    if (data != null && data.isNotEmpty) {
      list = data.map((isar) {
        return SurveyTemp(
            assignedLevelKey: isar.assignedLevelKey!,
            surveyLevelKey: isar.surveyLevelKey!,
            assignedLevelName: isar.assignedLevelName!,
            surveyLevelName: isar.surveyLevelName!,
            answers: isar.answers?.map((isar) {
              return SurveyTempAnswers(
                surveyId: isar.surveyId!,
                answer: isar.answer!,
                answerOptions: isar.answerOptions,
                questionId: isar.questionId!,
                typeId: isar.typeId!,
                question: isar.question!,
              );
            }).toList());
      }).toList();
    }
    return list;
  }

  Future<bool> clearSurveyTempDB() async {
    try {
      var isar = Isar.getInstance(db);
      final collection = isar!.collection<IsarSurveyTemp>();
      final data = await collection.where().findAll();

      await isar.writeTxn(() async {
        for (IsarSurveyTemp dta in data) {
          await collection.delete(dta.id);
        }
      });
      return true;
    } catch (error) {
      log('Error deleting data: $error');
      return false;
    }
  }
}
