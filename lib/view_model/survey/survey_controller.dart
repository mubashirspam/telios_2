import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telios_2/model/model.dart';
import 'package:telios_2/view_model/view_model.dart';
import '../../settings/settings.dart';

class SurveyController extends GetxController {
  final _service = Get.find<SurveyService>();

  ApiResponse<List<QuestionModel>> r = ApiResponse.initial();
  ApiResponse<List<SurveyAnswerModel>> a = ApiResponse.initial();
  ApiResponse<SurveyTemp> u = ApiResponse.initial();

  List<SurveyAnswerModel> geoJsonLevelAnswers = [];
  List<SurveyAnswerModel> surveyLevelAnswers = [];

  RxList<Question> questions = RxList<Question>([]);
  Rxn<SurveyAnswerModel> selectedAnswer = Rxn<SurveyAnswerModel>();

  RxList<QuestionModel> questionsModelList = RxList<QuestionModel>([]);

  RxBool isUploading = false.obs;
  RxBool isSyncing = false.obs;

  void setQuestion(int surveyId) {
    final QuestionModel? questionModel = questionsModelList
        .where((element) => element.surveyId == surveyId)
        .firstOrNull;
    if (questionModel != null) {
      questions.value = questionModel.questions;
      update();
    }
  }

  void selectAnAnswer(String surveyLevelKey) {
    selectedAnswer.value = surveyLevelAnswers
        .where((element) => element.surveyLevelKey == surveyLevelKey)
        .firstOrNull;

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
            update();
          },
          (remoteData) {
            r = ApiResponse.completed(remoteData);
            questionsModelList.value = remoteData;
            update();
          },
        );
      },
      (success) async {
        questionsModelList.value = success;
        r = ApiResponse.completed(success);
        update();
      },
    );
  }

  postSurveyAnswerRemote() async {
    if (r.state == ResponseState.loading) {
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
      final surveyData = surveyToJson(SurveyTempModel(surveyTemp: r));

      final result = await _service.postSurveyAnswerRemote(surveyData);
      result.fold((l) => u = ApiResponse.error(l), (r) {
        u = ApiResponse.completed(r);
      });
    });

    update();
  }

  Future<void> fetchSurveyAnswers({
    String? assignedLevelKey,
    String? geoJsonLevelKey,
    String? surveyLevelKey,
  }) async {
    if (r.state == ResponseState.loading) {
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
        update();
      },
      (success) async {
        a = ApiResponse.completed(success);

        if (success.isNotEmpty && assignedLevelKey != null) {
          geoJsonLevelAnswers = success;
        }
        if (success.isNotEmpty && geoJsonLevelKey != null) {
          surveyLevelAnswers = success;
        }

        update();
      },
    );
  }

  List<Answer>? getAnswers() {
    List<Answer> answers = [];

    for (var question in questions) {
      String category = '';
      if (question.answer.value.isNotEmpty) {
        category = categoryMap[question.question.toLowerCase()] ?? '';
      }

      if (question.type == 'multi_dropdown') {
        answers.add(Answer(
          id: question.question,
          answer: question.multiAnswer.toList().toString(),
          type: question.type,
        ));
      } else if (question.type == 'nested_dropdown') {
        answers.add(Answer(
          id: question.question,
          answer:
              'Main: ${question.answer.value}, Nested: ${question.nestedAnswer.value}',
          type: question.type,
        ));
      } else {
        answers.add(
          Answer(
            id: question.question,
            answer: question.answer.value,
            type: question.type,
            category: category,
            questionId: question.questionId,
            question: question.question,
            typeId: question.typeId,
            surveyId: question.surveyId,
          ),
        );
      }
    }
    return answers;
  }

  String getSCategory(List<Answer>? answers) {
    if (answers == null || answers.isEmpty) {
      return '';
    }

    bool hasAv = answers.any((answer) => answer.category == 'av');
    bool hasPc = answers.any((answer) => answer.category == 'pc');
    bool hasMc = answers.any((answer) => answer.category == 'mc');
    bool hasHc = answers.any((answer) => answer.category == 'hc');

    if (hasAv) {
      return 'av';
    } else if (hasMc) {
      return 'mc';
    } else if (hasHc) {
      return 'hc';
    } else if (hasPc) {
      return 'pc';
    } else {
      return '';
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
      await _updateControllers(event);
      clearAnswers();

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
      duration: const Duration(seconds: 3),
      backgroundColor: backgroundColor,
      snackPosition: SnackPosition.TOP,
    ));
  }

  SurveyAnswerModel _createSurveyAnswerModel(
    SurveyLevel level,
    String sCategory,
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
      gCategory: '',
      aCategory: '',
      answers: answers,
    );
  }

  SurveyTemp _createSurveyTemp(SurveyLevel level, List<Answer>? answers) {
    return SurveyTemp(
      assignedLevelKey: level.assignedLevelKey,
      surveyLevelKey: level.levelKey,
      assignedLevelName: level.assignedLevelName,
      surveyLevelName: level.levelName,
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
    await _service.postSurveyTempDB(answerDataTemp);
    await Future.delayed(const Duration(milliseconds: 300));
  }

  Future<void> _updateControllers(MapLevel event) async {
    await Get.find<LevelController>().fetchSurveyLevel(event);
    await Get.find<LevelController>().fetchMapLevel(event.assignedLevelKey!);
  }

  void clearAnswers() {
    for (var question in questions) {
      question.answer.value = ''; // Clear the main answer
      question.nestedAnswer.value = ''; // Clear nested answer if any
      question.multiAnswer.clear(); // Clear multiple answers
    }
  }
}
