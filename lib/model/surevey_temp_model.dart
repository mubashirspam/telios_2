


import 'dart:convert';

String surveyToJson(SurveyTempModel data) => json.encode(data.toJson());

class SurveyTempModel {
  final List<SurveyTemp>? surveyTemp;

  SurveyTempModel({
    this.surveyTemp,
  });

  Map<String, dynamic> toJson() {
    return {
      'survey':
          surveyTemp?.map((surveyTemp) => surveyTemp.toJson()).toList(),
    };
  }
}

class SurveyTemp {
  final String? surveyLevelName;
  final String? surveyLevelKey;
  final String? assignedLevelKey;
  final String? assignedLevelName;
  final List<SurveyTempAnswers>? answers;

  SurveyTemp({
    this.surveyLevelName,
    this.surveyLevelKey,
    this.assignedLevelKey,
    this.assignedLevelName,
    this.answers,
  });

  SurveyTemp copyWith({
    String? surveyLevelName,
    String? surveyLevelKey,
    String? assignedLevelKey,
    String? assignedLevelName,
    List<SurveyTempAnswers>? answers,
  }) {
    return SurveyTemp(
      surveyLevelName: surveyLevelName ?? this.surveyLevelName,
      surveyLevelKey: surveyLevelKey ?? this.surveyLevelKey,
      assignedLevelKey: assignedLevelKey ?? this.assignedLevelKey,
      assignedLevelName: assignedLevelName ?? this.assignedLevelName,
      answers: answers ?? this.answers,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'surveyLevelName': surveyLevelName,
      'surveyLevelKey': surveyLevelKey,
      'assignedLevelKey': assignedLevelKey,
      'assignedLevelName': assignedLevelName,
      'answers': answers?.map((answer) => answer.toJson()).toList(),
    };
  }
}

class SurveyTempAnswers {
  final int? surveyId;
  final int? questionId;
  final String? question;
  final int? typeId;
  final String? answer;
  final List<String>? answerOptions;

  SurveyTempAnswers({
    this.surveyId,
    this.questionId,
    this.question,
    this.typeId,
    this.answer,
    this.answerOptions,
  });

  SurveyTempAnswers copyWith({
    int? questionId,
    int? surveyId,
    String? question,
    int? typeId,
    String? answer,
    List<String>? answerOptions,
  }) {
    return SurveyTempAnswers(
      questionId: questionId ?? this.questionId,
      surveyId: surveyId ?? this.surveyId,
      question: question ?? this.question,
      typeId: typeId ?? this.typeId,
      answer: answer ?? this.answer,
      answerOptions: answerOptions ?? this.answerOptions,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'surveyId': surveyId,
      'questionId': questionId,
      'question': question,
      'typeId': typeId,
      'answer': answer,
      'answerOptions': answerOptions,
    };
  }
}
