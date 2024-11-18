import 'dart:convert';

String postSurveyToJson(PostSurvey data) => json.encode(data.toJson());

Survey surveyFromJson(String str) => Survey.fromJson(json.decode(str));


class PostSurvey {
  List<Survey>? survey;

  PostSurvey({
    this.survey,
  });

  Map<String, dynamic> toJson() => {
        "survey": survey == null
            ? []
            : List<dynamic>.from(survey!.map((x) => x.toJson())),
      };
}

class Survey {
  String? surveyLevelName;
  String? surveyLevelKey;
  String? assignedLevelKey;
  String? assignedLevelName;
  String? geoJsonLevelKey;
  String? geoJsonLevelName;
  List<SurveyAnswer>? surveyAnswers;

  Survey({
    this.surveyLevelName,
    this.surveyLevelKey,
    this.assignedLevelKey,
    this.assignedLevelName,
    this.geoJsonLevelKey,
    this.geoJsonLevelName,
    this.surveyAnswers,
  });

  Map<String, dynamic> toJson() => {
        "surveyLevelName ": surveyLevelName,
        "surveyLevelKey ": surveyLevelKey,
        "assignedLevelKey ": assignedLevelKey,
        "assignedLevelName ": assignedLevelName,
        "geojsonLevelKey": geoJsonLevelKey,
        "geojsonLevelName": geoJsonLevelName,
        "surveyAnswers": surveyAnswers == null
            ? []
            : List<dynamic>.from(surveyAnswers!.map((x) => x.toJson())),
      };

  factory Survey.fromJson(Map<String, dynamic> json) {
    return Survey(
      assignedLevelKey: json['assignedLevelKey'],
      assignedLevelName: json['assignedLevelName'],
      geoJsonLevelName: json['geojsonLevelName'],
      geoJsonLevelKey: json['geojsonLevelKey'],
      surveyAnswers: json['surveyAnswers'] != null
          ? List<SurveyAnswer>.from(
              json['surveyAnswers'].map((x) => SurveyAnswer.fromJson(x)))
          : [],
      surveyLevelKey: json['surveyLevelKey'],
      surveyLevelName: json['surveyLevelName'],
    );
  }
}

class SurveyAnswer {
  String? surveyId;
  List<AnswerClass>? answers;

  SurveyAnswer({
    this.surveyId,
    this.answers,
  });

  Map<String, dynamic> toJson() => {
        "surveyId": surveyId,
        "answers": answers == null
            ? []
            : List<dynamic>.from(answers!.map((x) => x.toJson())),
      };

  factory SurveyAnswer.fromJson(Map<String, dynamic> json) {
    return SurveyAnswer(
      answers: json['answers'] != null
          ? List<AnswerClass>.from(
              json['answers'].map((x) => AnswerClass.fromJson(x)))
          : [],
      surveyId: json['surveyId'],
    );
  }
}

class AnswerClass {
  int? questionId;
  String? question;
  int? typeId;
  String? answer;
  List<Option>? answerOptions;

  AnswerClass({
    this.questionId,
    this.question,
    this.typeId,
    this.answer,
    this.answerOptions,
  });

  Map<String, dynamic> toJson() => {
        "questionId ": questionId,
        "question ": question,
        "typeId ": typeId,
        "answer ": answer,
        "answerOptions ": answerOptions == null
            ? []
            : List<dynamic>.from(answerOptions!.map((x) => x.toJson())),
      };

  factory AnswerClass.fromJson(Map<String, dynamic> json) {
    return AnswerClass(
      answer: json['answer'],
      answerOptions: json['answerOptions'] != null
          ? List<Option>.from(
              json['answerOptions'].map((x) => Option.fromJson(x)))
          : [],
      question: json['question'],
      questionId: json['questionId'],
      typeId: json['typeId'],
    );
  }
}

class Option {
  int? optionId;
  String? optionValue;

  Option({
    this.optionId,
    this.optionValue,
  });

  Map<String, dynamic> toJson() => {
        "optionsId ": optionId,
        "optionValue ": optionValue,
      };

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      optionValue: json['optionValue'],
      optionId: json['optionsId'],
    );
  }
}
