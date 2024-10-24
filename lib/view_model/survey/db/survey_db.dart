import 'dart:developer';
import 'package:isar/isar.dart';
import 'package:telios_2/model/model.dart';
import '../../../settings/settings.dart';

class SurveyDB {
  SurveyDB._();
  static final instance = SurveyDB._();

  Future<void> postSurveyQuestionDB(QuestionModel? questionsData,
      String assignedLevelKey, int sureveyId) async {
    if (questionsData == null || questionsData.questions.isEmpty) {
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
          ..surveyName = questionsData.surveyName
          ..category = questionsData.surveyCategories.map((category) {
            return IsarSurveyCategory()
              ..categoryName = category.categoryName
              ..colorcode = category.categoryColor
              ..questionId = category.questionId
              ..surveyId = category.surveyId;
          }).toList()
          ..questions = questionsData.questions.map((question) {
            return IsarSurveyQusetion()
              ..questionId = question.questionId
              ..question = question.question
              ..type = question.type
              ..typeId = question.typeId
              ..colorcode = question.colorcode
              ..isquestionVisble = question.isquestionVisble
              ..hint = question.hint
              ..parentQuestionId = question.parentQuestionId
              ..isCounter = question.isCounter;
          }).toList();

        await collection?.put(newLevel);
      });
    } else {
      await isar?.writeTxn(() async {
        existingData.category = questionsData.surveyCategories
            .map(
              (e) => IsarSurveyCategory()
                ..categoryName = e.categoryName
                ..colorcode = e.categoryColor
                ..questionId = e.questionId
                ..surveyId = e.surveyId,
            )
            .toList();
        existingData.surveyName = questionsData.surveyName;

        existingData.questions = questionsData.questions.map((question) {
          return IsarSurveyQusetion()
            ..questionId = question.questionId
            ..question = question.question
            ..type = question.type
            ..typeId = question.typeId
            ..colorcode = question.colorcode
            ..isquestionVisble = question.isquestionVisble
            ..hint = question.hint
            ..parentQuestionId = question.parentQuestionId
            ..isCounter = question.isCounter;
        }).toList();

        await collection?.put(existingData);
      });
    }
  }

  Future<void> postDropDownOptionDB(MultiDropdownOptionModel? data) async {
    if (data == null || data.option == null || data.option!.isEmpty) {
      return;
    }

    final isar = Isar.getInstance(db);
    final collection = isar?.collection<IsarMultiDropdownOptionModel>();

    final existingData = await collection
        ?.where()
        .filter()
        .levelkeyEqualTo(data.levelkey)
        .and()
        .surveyIdEqualTo(data.surveyId)
        .findFirst();

    if (existingData == null) {
      await isar?.writeTxn(() async {
        final newLevel = IsarMultiDropdownOptionModel()
          ..levelkey = data.levelkey
          ..surveyId = data.surveyId
          ..options = data.option?.map((c) {
            return IsarChildOption()
              ..optionId = c.optionId
              ..optionValue = c.optionValue
              ..questionId = c.questionId;
          }).toList()
          ..nestedOptions = data.nestedOptions?.map((c) {
            return IsarChildOption()
              ..optionId = c.optionId
              ..optionValue = c.optionValue
              ..parentQuestionId = c.parentOptionId
              ..questionId = c.questionId;
          }).toList();

        await collection?.put(newLevel);
      });
    } else {
      await isar?.writeTxn(() async {
        existingData.options = data.option
            ?.map(
              (e) => IsarChildOption()
                ..questionId = e.questionId
                ..optionId = e.optionId
                ..optionValue = e.optionValue,
            )
            .toList();
        existingData.nestedOptions = data.nestedOptions
            ?.map(
              (e) => IsarChildOption()
                ..questionId = e.questionId
                ..optionId = e.optionId
                ..parentQuestionId = e.parentOptionId
                ..optionValue = e.optionValue,
            )
            .toList();

        await collection?.put(existingData);
      });
    }
  }

  Future<List<MultiDropdownOptionModel>?> fetchDropDownOptionDB({
    String? levelkey,
    int? surveyId,
    int? questionId,
  }) async {
    final isar = Isar.getInstance(db);
    final collection = isar?.collection<IsarMultiDropdownOptionModel>();

    final data = await collection
        ?.where()
        .filter()
        .levelkeyEqualTo(levelkey)
        .and()
        .surveyIdEqualTo(surveyId)
        .findAll();

    List<MultiDropdownOptionModel>? result;

    if (data != null && data.isNotEmpty) {
      result = data.map((e) {
        return MultiDropdownOptionModel(
          levelkey: e.levelkey,
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
        );
      }).toList();
    }

    return result;
  }

  Future<bool> clearDropDownOptioDB() async {
    try {
      var isar = Isar.getInstance(db);
      final collection = isar!.collection<IsarMultiDropdownOptionModel>();
      final data = await collection.where().findAll();

      await isar.writeTxn(() async {
        for (IsarMultiDropdownOptionModel dta in data) {
          await collection.delete(dta.id);
        }
      });
      return true;
    } catch (error) {
      log('Error deleting data: $error');
      return false;
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
              ..questionId = answer.questionId
              ..typeId = answer.typeId
              ..surveyId = answer.surveyId
              ..answerOptions = answer.answerOptions
                  ?.map((v) => IsarDItem()
                    ..id = v.id
                    ..name = v.name)
                  .toList()
              ..question = answer.question
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
                ?.map((v) => IsarDItem()
                  ..id = v.id
                  ..name = v.name)
                .toList()
            ..question = answer.question
            ..answer = answer.answer
            ..category = answer.category
            ..type = answer.type;
        }).toList();

        await collection?.put(existingData);
      });
    }
  }

  // Future<void> syncSurveyAnswerDB(
  //     List<SyncSurveyAnswerModel> answerData, String assignedLevelKey) async {
  //   final isar = Isar.getInstance(db);
  //   final collection = isar?.collection<IsarSurveyAnswerModel>();

  //   final existingData = await collection
  //       ?.where()
  //       .filter()
  //       .assignedLevelKeyEqualTo(assignedLevelKey)
  //       .findAll();

  //   if (existingData == null || existingData.isEmpty) {
  //     await isar?.writeTxn(() async {
  //       for (var item in answerData) {
  //         final newItem = IsarSurveyAnswerModel()
  //           ..surveyLevelKey = item.levelKey
  //           ..surveyLevelName = item.levelName
  //           ..assignedLevelKey = assignedLevelKey
  //           ..answers = item.answers?.map((a) {
  //             return IsarAnswer()
  //               ..id = a.questionId?.toString()
  //               ..answer = a.answer
  //               ..questionId = a.questionId
  //               ..answerOptions = a.answerOptions?.map((option) {
  //                 return IsarDItem()
  //                   ..id = option.id
  //                   ..name = option.name;
  //               }).toList();
  //           }).toList();

  //         await collection?.put(newItem);
  //       }
  //     });
  //   }
  // }

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
              surveyCategories: e.category?.map((e) {
                    return SurveyCategory(
                      categoryName: e.categoryName,
                      categoryColor: e.colorcode,
                      questionId: e.questionId,
                      surveyId: e.surveyId,
                    );
                  }).toList() ??
                  [],
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
                  parentQuestionId: isar.parentQuestionId,
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
