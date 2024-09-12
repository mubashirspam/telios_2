import 'dart:developer';
import 'package:isar/isar.dart';
import 'package:telios_2/model/model.dart';
import '../../../settings/settings.dart';

class SurveyDB {
  SurveyDB._();
  static final instance = SurveyDB._();

  Future<void> postSurveyQuestionDB(List<Question>? questionsData,
      String assignedLevelKey, int sureveyId) async {
    if (questionsData == null || questionsData.isEmpty) {
      return;
    }

    final isar = Isar.getInstance(db);
    final collection = isar?.collection<IsarSurveyQusetionModel>();

    final existingData = await collection
        ?.where()
        .filter()
        .assignedLevelKeyEqualTo(assignedLevelKey)
        .and()
        .sureveyIdEqualTo(sureveyId)
        .findFirst();

    if (existingData == null) {
      await isar?.writeTxn(() async {
        final newLevel = IsarSurveyQusetionModel()
          ..assignedLevelKey = assignedLevelKey
          ..sureveyId = sureveyId
          ..surveyName = questionsData.first.surveyName
          ..questions = questionsData.map((question) {
            return IsarSurveyQusetion()
              ..questionId = question.questionId
              ..question = question.question
              ..type = question.type
              ..typeId = question.typeId
              ..colorcode = question.colorcode
              ..isquestionVisble = question.isquestionVisble
              ..hint = question.hint
              ..isCounter = question.isCounter;
          }).toList();

        await collection?.put(newLevel);
      });
    } else {
      await isar?.writeTxn(() async {
        existingData.questions = questionsData.map((question) {
          return IsarSurveyQusetion()
            ..questionId = question.questionId
            ..question = question.question
            ..type = question.type
            ..typeId = question.typeId
            ..colorcode = question.colorcode
            ..isquestionVisble = question.isquestionVisble
            ..hint = question.hint
            ..isCounter = question.isCounter;
        }).toList();

        await collection?.put(existingData);
      });
    }
  }

  Future<void> postSurveyAnswerDB(SurveyAnswerModel answerData) async {
    final isar = Isar.getInstance(db);
    final collection = isar?.collection<IsarSurveyAnswerModel>();

    final existingData = await collection
        ?.where()
        .filter()
        .assignedLevelKeyEqualTo(answerData.assignedLevelKey)
        .and()
        .geoJsonLevelKeyEqualTo(answerData.geoJsonLevelKey)
        .and()
        .surveyLevelKeyEqualTo(answerData.surveyLevelKey)
        .findFirst();

    if (existingData == null) {
      await isar?.writeTxn(() async {
        final newLevel = IsarSurveyAnswerModel()
          ..assignedLevelKey = answerData.assignedLevelKey
          ..geoJsonLevelKey = answerData.geoJsonLevelKey
          ..surveyLevelKey = answerData.surveyLevelKey
          ..assignedLevelName = answerData.assignedLevelName
          ..geoJsonLevelName = answerData.geoJsonLevelName
          ..surveyLevelName = answerData.surveyLevelName
          ..gCategory = answerData.gCategory
          ..aCategory = answerData.aCategory
          ..sCategory = answerData.sCategory
          ..answers = answerData.answers?.map((answer) {
            return IsarAnswer()
              ..id = answer.id
              ..answer = answer.answer
              ..category = answer.category
              ..type = answer.type;
          }).toList();

        await collection?.put(newLevel);
      });
    } else {
      await isar?.writeTxn(() async {
        existingData.gCategory = answerData.gCategory;
        existingData.aCategory = answerData.aCategory;
        existingData.sCategory = answerData.sCategory;
        existingData.answers = answerData.answers?.map((answer) {
          return IsarAnswer()
            ..id = answer.id
            ..questionId = answer.questionId
            ..typeId = answer.typeId
            ..surveyId = answer.surveyId
            ..answerOptions = answer.answerOptions
            ..question = answer.question
            ..answer = answer.answer
            ..category = answer.category
            ..type = answer.type;
        }).toList();

        await collection?.put(existingData);
      });
    }
  }

  Future<List<SurveyAnswerModel>?> fetchSurveyAnswerDB(
      {String? assignedLevelKey,
      String? geoJsonLevelKey,
      String? surveyLevelKey}) async {
    final isar = Isar.getInstance(db);
    final collection = isar?.collection<IsarSurveyAnswerModel>();

    if (collection == null) return null;

    var query = collection.where().filter();

    List<IsarSurveyAnswerModel> data = [];
    if (surveyLevelKey != null) {
      data = await query.surveyLevelKeyEqualTo(surveyLevelKey).findAll();
    } else {
      if (assignedLevelKey != null && geoJsonLevelKey != null) {
        data = await query
            .assignedLevelKeyEqualTo(assignedLevelKey)
            .and()
            .geoJsonLevelKeyEqualTo(geoJsonLevelKey)
            .findAll();
      } else if (assignedLevelKey != null) {
        data = await query.assignedLevelKeyEqualTo(assignedLevelKey).findAll();
      } else if (geoJsonLevelKey != null) {
        data = await query.geoJsonLevelKeyEqualTo(geoJsonLevelKey).findAll();
      }
    }

    if (data.isNotEmpty) {
      return data.map((isar) {
        return SurveyAnswerModel(
          assignedLevelKey: isar.assignedLevelKey,
          geoJsonLevelKey: isar.geoJsonLevelKey,
          surveyLevelKey: isar.surveyLevelKey,
          assignedLevelName: isar.assignedLevelName,
          geoJsonLevelName: isar.geoJsonLevelName,
          surveyLevelName: isar.surveyLevelName,
          gCategory: isar.gCategory,
          aCategory: isar.aCategory,
          sCategory: isar.sCategory,
          answers: isar.answers?.map((answer) {
            return Answer(
              id: answer.id,
              answer: answer.answer,
              type: answer.type,
              category: answer.category,
              answerOptions: answer.answerOptions,
              question: answer.question,
              questionId: answer.questionId,
              surveyId: answer.surveyId,
              typeId: answer.typeId,
            );
          }).toList(),
        );
      }).toList();
    }
    return null;
  }

  Future<List<QuestionModel>?> fetchSurveyQustionDB(
      String assignedLevelKey) async {
    var isar = Isar.getInstance(db);
    final collection = isar?.collection<IsarSurveyQusetionModel>();

    final data = await collection
        ?.where()
        .filter()
        .assignedLevelKeyEqualTo(assignedLevelKey)
        .findAll();

    if (data != null && data.isNotEmpty) {
      return data
          .map(
            (e) => QuestionModel(
              surveyId: e.sureveyId!,
              surveyName: e.surveyName!,
              questions: e.questions!.map((isar) {
                return Question(
                  questionId: isar.questionId!,
                  question: isar.question!,
                  type: isar.type!,
                  colorcode: isar.colorcode,
                  isquestionVisble: isar.isquestionVisble,
                  hint: isar.hint,
                  isCounter: isar.isCounter,
                  typeId: isar.typeId!,
                  surveyId: e.sureveyId!,
                  surveyName: e.surveyName!,
                  options: null,
                  nestedOptions: null,
                );
              }).toList(),
            ),
          )
          .toList();
    }
    return null;
  }

  Future<bool> clearSurveyQustionDB() async {
    try {
      var isar = Isar.getInstance(db);
      final collection = isar!.collection<IsarSurveyQusetionModel>();
      final data = await collection.where().findAll();

      await isar.writeTxn(() async {
        for (IsarSurveyQusetionModel dta in data) {
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
