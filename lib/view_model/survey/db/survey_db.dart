import 'dart:developer';

import 'package:hive/hive.dart';

import '../../../model/model.dart';
import '../../../settings/settings.dart';

class SurveyDB {
  SurveyDB._();
  static final instance = SurveyDB._();

  final questionBox =
      Hive.box<HiveSurveyQuestionModel>(HiveBoxes.surveyQuestions);
  final dropdownBox =
      Hive.box<HiveMultiDropdownOptionModel>(HiveBoxes.multiDropdownOptions);
  final answerBox = Hive.box<HiveSurveyAnswerModel>(HiveBoxes.surveyAnswers);

  Future<void> postSurveyQuestionDB(QuestionModel? questionsData,
      String assignedLevelKey, int sureveyId) async {
    if (questionsData == null || questionsData.questions.isEmpty) {
      return;
    }

    String key = '${assignedLevelKey}_$sureveyId';

    final existingData = questionBox.get(key);

    if (existingData == null) {
      final newLevel = HiveSurveyQuestionModel()
        ..assignedLevelKey = assignedLevelKey
        ..surveyId = sureveyId
        ..surveyName = questionsData.surveyName
        ..category = questionsData.surveyCategories.map((category) {
          return HiveSurveyCategory()
            ..categoryName = category.categoryName
            ..colorcode = category.categoryColor
            ..questionId = category.questionId
            ..surveyId = category.surveyId;
        }).toList()
        ..questions = questionsData.questions.map((question) {
          return HiveSurveyQuestion()
            ..questionId = question.questionId
            ..question = question.question
            ..type = question.type
            ..typeId = question.typeId
            ..colorcode = question.colorcode
            ..isQuestionVisible = question.isquestionVisble
            ..hint = question.hint
            ..parentQuestionId = question.parentQuestionId
            ..isCounter = question.isCounter;
        }).toList();

      await questionBox.put(key, newLevel);
    } else {
      existingData.category = questionsData.surveyCategories
          .map((e) => HiveSurveyCategory()
            ..categoryName = e.categoryName
            ..colorcode = e.categoryColor
            ..questionId = e.questionId
            ..surveyId = e.surveyId)
          .toList();
      existingData.surveyName = questionsData.surveyName;
      existingData.questions = questionsData.questions.map((question) {
        return HiveSurveyQuestion()
          ..questionId = question.questionId
          ..question = question.question
          ..type = question.type
          ..typeId = question.typeId
          ..colorcode = question.colorcode
          ..isQuestionVisible = question.isquestionVisble
          ..hint = question.hint
          ..parentQuestionId = question.parentQuestionId
          ..isCounter = question.isCounter;
      }).toList();

      await questionBox.put(key, existingData);
    }
  }

  Future<void> postDropDownOptionDB(MultiDropdownOptionModel? data) async {
    if (data == null || data.option == null || data.option!.isEmpty) {
      return;
    }

    String key = '${data.levelkey}_${data.surveyId}';

    final existingData = dropdownBox.get(key);

    if (existingData == null) {
      final newLevel = HiveMultiDropdownOptionModel()
        ..levelKey = data.levelkey
        ..surveyId = data.surveyId
        ..options = data.option?.map((c) {
          return HiveChildOption()
            ..optionId = c.optionId
            ..optionValue = c.optionValue
            ..questionId = c.questionId;
        }).toList()
        ..nestedOptions = data.nestedOptions?.map((c) {
          return HiveChildOption()
            ..optionId = c.optionId
            ..optionValue = c.optionValue
            ..parentQuestionId = c.parentOptionId
            ..questionId = c.questionId;
        }).toList();

      await dropdownBox.put(key, newLevel);
    } else {
      existingData.options = data.option
          ?.map((e) => HiveChildOption()
            ..questionId = e.questionId
            ..optionId = e.optionId
            ..optionValue = e.optionValue)
          .toList();

      existingData.nestedOptions = data.nestedOptions
          ?.map((e) => HiveChildOption()
            ..questionId = e.questionId
            ..optionId = e.optionId
            ..parentQuestionId = e.parentOptionId
            ..optionValue = e.optionValue)
          .toList();

      await dropdownBox.put(key, existingData);
    }
  }

  Future<void> postSurveyAnswerDB(SurveyAnswerModel answerData) async {
    String key =
        '${answerData.assignedLevelKey}_${answerData.geoJsonLevelKey}_${answerData.surveyLevelKey}';

    final existingData = answerBox.get(key);

    if (existingData == null) {
      final newAnswer = HiveSurveyAnswerModel()
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
          return HiveAnswer()
            ..id = answer.id
            ..questionId = answer.questionId
            ..typeId = answer.typeId
            ..surveyId = answer.surveyId
            ..answerOptions = answer.answerOptions
                ?.map((v) => HiveDItem()
                  ..id = v.id
                  ..name = v.name)
                .toList()
            ..question = answer.question
            ..answer = answer.answer
            ..category = answer.category
            ..type = answer.type;
        }).toList();

      await answerBox.put(key, newAnswer);
    } else {
      existingData.gCategory = answerData.gCategory;
      existingData.aCategory = answerData.aCategory;
      existingData.sCategory = answerData.sCategory;
      existingData.answers = answerData.answers?.map((answer) {
        return HiveAnswer()
          ..id = answer.id
          ..questionId = answer.questionId
          ..typeId = answer.typeId
          ..surveyId = answer.surveyId
          ..answerOptions = answer.answerOptions
              ?.map((v) => HiveDItem()
                ..id = v.id
                ..name = v.name)
              .toList()
          ..question = answer.question
          ..answer = answer.answer
          ..category = answer.category
          ..type = answer.type;
      }).toList();

      await answerBox.put(key, existingData);
    }
  }

  Future<List<QuestionModel>?> fetchSurveyQustionDB(
      String assignedLevelKey) async {
    final data = questionBox.values
        .where((item) => item.assignedLevelKey == assignedLevelKey)
        .toList();

    if (data.isNotEmpty) {
      return data
          .map((e) => QuestionModel(
                surveyId: e.surveyId ?? 0,
                surveyName: e.surveyName ?? "",
                surveyCategories: e.category?.map((e) {
                      return SurveyCategory(
                        categoryName: e.categoryName,
                        categoryColor: e.colorcode,
                        questionId: e.questionId,
                        surveyId: e.surveyId,
                      );
                    }).toList() ??
                    [],
                questions: e.questions!.map((hive) {
                  return Question(
                    questionId: hive.questionId ?? 0,
                    question: hive.question ?? '',
                    type: hive.type ?? '',
                    colorcode: hive.colorcode,
                    isquestionVisble: hive.isQuestionVisible,
                    hint: hive.hint,
                    isCounter: hive.isCounter,
                    typeId: hive.typeId ?? 0,
                    surveyId: e.surveyId ?? 0,
                    surveyName: e.surveyName ?? '',
                    parentQuestionId: hive.parentQuestionId,
                    options: null,
                    nestedOptions: null,
                  );
                }).toList(),
              ))
          .toList();
    }
    return null;
  }

  Future<List<MultiDropdownOptionModel>?> fetchDropDownOptionDB({
    String? levelkey,
    int? surveyId,
    int? questionId,
  }) async {
    final data = dropdownBox.values
        .where((item) =>
            (levelkey == null || item.levelKey == levelkey) &&
            (surveyId == null || item.surveyId == surveyId))
        .toList();

    if (data.isNotEmpty) {
      return data
          .map((e) => MultiDropdownOptionModel(
                levelkey: e.levelKey,
                surveyId: e.surveyId,
                nestedOptions: e.nestedOptions
                    ?.map((e) => ChildOption(
                        questionId: e.questionId,
                        optionId: e.optionId,
                        parentOptionId: e.parentQuestionId,
                        optionValue: e.optionValue))
                    .toList(),
                option: e.options
                    ?.map((e) => ChildOption(
                        questionId: e.questionId,
                        optionId: e.optionId,
                        optionValue: e.optionValue))
                    .toList(),
              ))
          .toList();
    }
    return null;
  }



  Future<List<SurveyAnswerModel>?> fetchSurveyAnswerDB({
    String? assignedLevelKey,
    String? geoJsonLevelKey,
    String? surveyLevelKey,
  }) async {
    try {
      final allAnswers = answerBox.values.toList();
      List<HiveSurveyAnswerModel> filteredData = [];

      if (surveyLevelKey != null) {
        filteredData = allAnswers
            .where((answer) => answer.surveyLevelKey == surveyLevelKey)
            .toList();
      } else {
        if (assignedLevelKey != null && geoJsonLevelKey != null) {
          filteredData = allAnswers
              .where((answer) =>
                  answer.assignedLevelKey == assignedLevelKey &&
                  answer.geoJsonLevelKey == geoJsonLevelKey)
              .toList();
        } else if (assignedLevelKey != null) {
          filteredData = allAnswers
              .where((answer) => answer.assignedLevelKey == assignedLevelKey)
              .toList();
        } else if (geoJsonLevelKey != null) {
          filteredData = allAnswers
              .where((answer) => answer.geoJsonLevelKey == geoJsonLevelKey)
              .toList();
        }
      }

      if (filteredData.isNotEmpty) {
        return filteredData.map((hive) {
          return SurveyAnswerModel(
            assignedLevelKey: hive.assignedLevelKey,
            geoJsonLevelKey: hive.geoJsonLevelKey,
            surveyLevelKey: hive.surveyLevelKey,
            assignedLevelName: hive.assignedLevelName,
            geoJsonLevelName: hive.geoJsonLevelName,
            surveyLevelName: hive.surveyLevelName,
            gCategory: hive.gCategory,
            aCategory: hive.aCategory,
            sCategory: hive.sCategory,
            answers: hive.answers?.map((answer) {
              return Answer(
                id: answer.id,
                answer: answer.answer,
                type: answer.type,
                category: answer.category,
                answerOptions: answer.answerOptions
                    ?.map((v) => DItem(v.name ?? '', v.id ?? 0))
                    .toList(),
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
    } catch (error) {
      log('Error fetching data: $error');
      return null;
    }
  }

    Future<bool> clearSurveyQuestionDB() async {
    try {
      await questionBox.clear();
      return true;
    } catch (error) {
      log('Error deleting data: $error');
      return false;
    }
  }

  Future<bool> clearSurveyAnswerDB() async {
    try {
      await answerBox.clear();
      return true;
    } catch (error) {
      log('Error deleting data: $error');
      return false;
    }
  }

  Future<bool> clearDropDownOptionDB() async {
    try {
      await dropdownBox.clear();
      return true;
    } catch (error) {
      log('Error deleting data: $error');
      return false;
    }
  }
}
