import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:telios_2/model/model.dart';
import 'package:telios_2/view_model/view_model.dart';
import '../../settings/settings.dart';

class SurveyController extends GetxController {
  final _service = Get.find<SurveyService>();
  final empty = SurveyCategory(
    categoryColor: 0xFFFFFFFF,
    categoryName: "Empty",
    questionId: 0,
  );

  ApiResponse<List<QuestionModel>> r = ApiResponse.initial();
  ApiResponse<List<SurveyAnswerModel>> a = ApiResponse.initial();
  ApiResponse<PostSurveyResponseModel> u = ApiResponse.initial();

  ApiResponse<List<SurveyAnswerModel>> s = ApiResponse.initial();

  List<SurveyAnswerModel> geoJsonLevelAnswers = [];
  List<SurveyAnswerModel> surveyLevelAnswers = [];

  RxList<Question> questions = RxList<Question>([]);
  Rxn<SurveyAnswerModel> selectedAnswer = Rxn<SurveyAnswerModel>();

  RxBool presentDataForSync = false.obs;

  List<SurveyTemp> surveyTemp = [];



  RxList<QuestionModel> questionsModelList = RxList<QuestionModel>([]);
  RxList<SurveyCategory> categoryList = RxList<SurveyCategory>([]);
  RxList<MultiDropdownOptionModel> dropDownOptions =
      RxList<MultiDropdownOptionModel>([]);

  List<MapColorMapper> colorMappers = <MapColorMapper>[
    const MapColorMapper(value: "Empty", color: Colors.white),
  ];

  RxBool isUploading = false.obs;
  RxBool isSyncing = false.obs;
  RxBool isFormLoading = false.obs;

  void setQuestion(int surveyId) {
    final QuestionModel? questionModel = questionsModelList
        .where((element) => element.surveyId == surveyId)
        .firstOrNull;
    if (questionModel != null) {
      questions.value = questionModel.questions;
      update();
    }
  }

  Future<void> selectAnAnswer(String surveyLevelKey) async {
    if (surveyLevelAnswers.isEmpty) {
      return;
    }
    isFormLoading.value = true;
    update();
    await Future.delayed(const Duration(milliseconds: 100));

    selectedAnswer.value = surveyLevelAnswers
        .where((element) => element.surveyLevelKey == surveyLevelKey)
        .firstOrNull;
    isFormLoading.value = false;
    update();
  }

  Future<void> fetchSurveyQustions({
    required String assignedLevelKey,
  }) async {
    if (r.state == ResponseState.loading) {
      return;
    }
    r = ApiResponse.loading();

    update();

    final localResult = await _service.fetchSurveyQustions(
      isRemote: false,
      assignedLevelKey: assignedLevelKey,
    );

    localResult.fold(
      (failure) async {
        final remoteResult = await _service.fetchSurveyQustions(
            isRemote: true, assignedLevelKey: assignedLevelKey);
        remoteResult.fold(
          (remoteFailure) {
            r = ApiResponse.error(remoteFailure);
            debugPrint("Error message: ${remoteFailure.message}");
            update();
          },
          (success) async {
            await _handleSurveyData(success, assignedLevelKey);
            r = ApiResponse.completed(success);

            update();
          },
        );
      },
      (success) async {
        await _handleSurveyData(success, assignedLevelKey);
        r = ApiResponse.completed(success);

        update();
      },
    );
  }

  Future<void> fetchDropdownOptions({
    required String levelKey,
    required int? surveyId,
  }) async {
    final localResult = await _service.fetchDropdownOptions(
      isRemote: false,
      levelKey: levelKey,
      surveyId: surveyId,
    );

    localResult.fold(
      (f) async {
        final remoteResult = await _service.fetchDropdownOptions(
          isRemote: true,
          levelKey: levelKey,
          surveyId: surveyId,
        );
        remoteResult.fold(
          (f) {
            update();
          },
          (s) {
            dropDownOptions.value = s;
            update();
          },
        );
      },
      (s) {
        dropDownOptions.value = s;
        update();
      },
    );
  }

  Future<void> _handleSurveyData(List<QuestionModel> data, String key) async {
    questionsModelList.value = data;

    categoryList
      ..clear()
      ..addAll(data.expand((q) => q.surveyCategories))
      ..add(empty);

    colorMappers
      ..clear()
      ..addAll(
        categoryList.map(
          (cc) => MapColorMapper(
            color: Color(cc.categoryColor ?? 0xFF000000),
            value: cc.questionId.toString(),
          ),
        ),
      );

    await _hndleSurveyOption(data, key);
  }

  Future<void> _hndleSurveyOption(List<QuestionModel> data, String key) async {
    for (var questionModel in data) {
      await fetchDropdownOptions(
              levelKey: key, surveyId: questionModel.surveyId)
          .then((r) =>
              processQuestionsAndOptions(questionModel, dropDownOptions));
    }
  }

  void processQuestionsAndOptions(QuestionModel questionModel,
      RxList<MultiDropdownOptionModel> dropDownOptions) {
    var matchingDropDownOption = dropDownOptions.firstWhereOrNull(
        (dropDownOption) => dropDownOption.surveyId == questionModel.surveyId);

    if (matchingDropDownOption != null) {
      for (Question question in questionModel.questions) {
        bool? matchingOption = matchingDropDownOption.option
            ?.any((o) => o.questionId == question.questionId);

        bool? matchingNestedOption = matchingDropDownOption.nestedOptions
            ?.any((o) => o.questionId == question.questionId);

        if (matchingOption ?? false) {
          question.options = matchingDropDownOption.option
              ?.where((option) => option.questionId == question.questionId)
              .map(
                  (option) => DItem(option.optionValue ?? '', option.optionId!))
              .toList();
        }
        if (matchingNestedOption ?? false) {
          Map<int, List<DItem>> result = {};

          for (ChildOption option
              in matchingDropDownOption.nestedOptions ?? []) {
            if (option.parentOptionId != null) {
              result.putIfAbsent(option.parentOptionId!, () => []);

              result[option.parentOptionId!]!.add(DItem(
                option.optionValue ?? '',
                option.optionId ?? -1,
              ));
            }
          }
          question.nestedOptions = result;
        }
      }
    }
  }

  Future<List<SurveyTemp>?> fetchSurveyTempDB() async {
    presentDataForSync.value = false;
    final data = await _service.fetchSurveyTempDB();
    update();
    data.fold((l) {
      return null;
    }, (r) {
      if (r.isNotEmpty) {
        presentDataForSync.value = true;
        surveyTemp = r;
        update();
        return r;
      }
      update();
      return null;
    });
    update();
    return null;
  }

  postSurveyAnswerRemote() async {
    if (u.state == ResponseState.loading) {
      return;
    }

    u = ApiResponse.loading();
    update();

    final data = await _service.fetchSurveyTempDB();

    data.fold((l) {
      u = ApiResponse.initial();
      update();
      return;
    }, (r) async {
      final data = convertTempAnswerToPostRemoteAnswer(r);
      final surveyData = postSurveyToJson(data);
      final result = await _service.postSurveyAnswerRemote(surveyData);
      result.fold((l) => u = ApiResponse.error(l), (r) {
        if (r.response?.data?.first.fieldData?.alert ==
            "Json has been inserted") {
          _service.clearSurveyTempDB();
          presentDataForSync.value = false;
          u = ApiResponse.completed(r);
          update();
        }

        u = ApiResponse.initial();
      });
    });
    u = ApiResponse.initial();

    update();
  }

  Future<void> fetchSurveyAnswers({
    String? assignedLevelKey,
    String? geoJsonLevelKey,
    String? surveyLevelKey,
  }) async {
    if (a.state == ResponseState.loading) {
      return;
    }
    a = ApiResponse.loading();

    update();

    final localResult = await _service.fetchSurveyAnswerDB(
      surveyLevelKey: surveyLevelKey,
      geoJsonLevelKey: geoJsonLevelKey,
      assignedLevelKey: assignedLevelKey,
    );

    localResult.fold(
      (failure) async {
        a = ApiResponse.error(failure);
        debugPrint("Error message: ${failure.message}=========");

        if (assignedLevelKey != null) {
          syncSurveyAnswers(assignedLevelKey);
        }

        update();
      },
      (success) async {
        if (success.isNotEmpty && assignedLevelKey != null) {
          geoJsonLevelAnswers = success;
        }
        if (success.isNotEmpty && geoJsonLevelKey != null) {
          surveyLevelAnswers = success;
        }
        a = ApiResponse.completed(success);

        update();
      },
    );
  }

  List<Answer>? getAnswers() {
    List<Answer> answers = [];

    for (var question in questions) {
      int category = 0;
      if (question.answer.value.isNotEmpty) {
        if (categoryList
            .any((test) => test.questionId == question.questionId)) {
          category = question.questionId;
        } else {
          category = 0;
        }
      }

      answers.add(
        Answer(
          id: question.question,
          answer: question.answer.value,
          type: question.type,
          answerOptions: question.multiAnswer.isEmpty
              ? question.multiAnswernestedAnswer
              : question.multiAnswer,
          category: category,
          questionId: question.questionId,
          question: question.question,
          typeId: question.typeId,
          surveyId: question.surveyId,
        ),
      );

      // if (question.type == 'multi_dropdown') {
      //   answers.add(Answer(
      //     id: question.question,
      //     answer: question.multiAnswer.toList().toString(),
      //     type: question.type,
      //   ));
      // } else if (question.type == 'nested_dropdown') {
      //   answers.add(Answer(
      //     id: question.question,
      //     answer:
      //         'Main: ${question.answer.value}, Nested: ${question.nestedAnswer.value}',
      //     type: question.type,
      //   ));
      // } else {

      // }
    }
    return answers;
  }

  int getSCategory(List<Answer>? answers) {
    if (answers == null || answers.isEmpty) {
      return 0;
    }

    bool hasAv =
        answers.any((answer) => answer.category == 27 || answer.category == 28);

    bool hasPc = answers.any((answer) => answer.category == 20);
    bool hasMc = answers.any((answer) => answer.category == 22);
    bool hasHc = answers.any((answer) => answer.category == 21);

    if (hasAv) {
      return 27;
    } else if (hasMc) {
      return 22;
    } else if (hasHc) {
      return 21;
    } else if (hasPc) {
      return 20;
    } else {
      return 0;
    }
  }

  Future<void> takeSurvey({
    required SurveyLevel level,
    required MapLevel event,
  }) async {
    if (isUploading.value) {
      return;
    }

    if (_areAllFieldsEmpty()) {
      _showSnackbar(
        "Please fill out all fields before submitting!",
        backgroundColor: Colors.yellow,
      );
      return;
    }

    try {
      isUploading.value = true;
      update();
      final answers = getAnswers();
      final sCategory = getSCategory(answers);
      final answerData = _createSurveyAnswerModel(level, sCategory, answers);
      final answerDataTemp = _createSurveyTemp(level, answers);
      await _submitSurveyData(answerData, answerDataTemp);
      clearAnswers();
      await _updateControllers(event);

      _showSnackbar(
        'Survey submitted successfully for ${level.levelName} (${level.levelKey})',
        backgroundColor: Colors.green,
      );
    } catch (e) {
      _showSnackbar(
        'Error submitting survey: $e',
        backgroundColor: Colors.red,
      );
    } finally {
      isUploading.value = false;
      update();
    }
  }

  bool _areAllFieldsEmpty() {
    return questions.every((question) => question.answer.value.isEmpty);
  }

  void _showSnackbar(String message, {required Color backgroundColor}) {
    Get.showSnackbar(GetSnackBar(
      messageText: Text(message),
      duration: const Duration(seconds: 1),
      backgroundColor: backgroundColor,
      snackPosition: SnackPosition.BOTTOM,
    ));
  }

  SurveyAnswerModel _createSurveyAnswerModel(
    SurveyLevel level,
    int sCategory,
    List<Answer>? answers,
  ) {
    return SurveyAnswerModel(
      assignedLevelKey: level.assignedLevelKey,
      geoJsonLevelKey: level.geoJsonLevelKey,
      surveyLevelKey: level.levelKey,
      assignedLevelName: level.assignedLevelName,
      geoJsonLevelName: level.geoJsonLevelName,
      surveyLevelName: level.levelName,
      sCategory: sCategory,
      gCategory: 0,
      aCategory: 0,
      answers: answers,
    );
  }

  SurveyTemp _createSurveyTemp(SurveyLevel level, List<Answer>? answers) {
    return SurveyTemp(
      assignedLevelKey: level.assignedLevelKey,
      surveyLevelKey: level.levelKey,
      assignedLevelName: level.assignedLevelName,
      surveyLevelName: level.levelName,
      geoJsonLevelKey: level.geoJsonLevelKey,
      geoJsonLevelName: level.geoJsonLevelName,
      answers: _convertToSurveyTempAnswers(answers),
    );
  }

  List<SurveyTempAnswers> _convertToSurveyTempAnswers(List<Answer>? answers) {
    return answers
            ?.map((answer) => SurveyTempAnswers(
                  questionId: answer.questionId,
                  question: answer.question,
                  typeId: answer.typeId,
                  answer: answer.answer,
                  answerOptions: answer.answerOptions,
                  surveyId: answer.surveyId,
                ))
            .toList() ??
        [];
  }

  Future<void> _submitSurveyData(
    SurveyAnswerModel answerData,
    SurveyTemp answerDataTemp,
  ) async {
    await _service.postSurveyAnswerDB(answerData);
    await Future.delayed(const Duration(milliseconds: 200));
    await _service.postSurveyTempDB(answerDataTemp);
  }

  Future<void> _updateControllers(MapLevel event) async {
    await fetchSurveyTempDB();
    await Get.find<LevelController>()
        .fetchMapLevel(event.assignedLevelKey!, '');
    await Future.delayed(const Duration(milliseconds: 100));
    await Get.find<LevelController>().fetchSurveyLevel(event);
  }

  void clearAnswers() {
    for (var question in questions) {
      question.answer.value = ''; // Clear the main answer
      question.nestedAnswer.value = ''; // Clear nested answer if any
      question.multiAnswer.clear(); // Clear multiple answers
    }
  }

  Future<void> syncSurveyAnswers(String unitKey) async {
    if (s.state == ResponseState.loading) {
      return;
    }

    s = ApiResponse.loading();
    update();
    final data = await _service.syncSurveyAnswers(unitKey);
    data.fold((l) {
      s = ApiResponse.error(l);
      update();
    }, (r) async {
      for (SurveyAnswerModel answer in r) {
        answer.sCategory = getSCategory(answer.answers);

        await _service.postSurveyAnswerDB(answer);
      }

      s = ApiResponse.completed(r);
      update();
    });
  }
}
