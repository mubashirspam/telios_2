import 'package:telios_2/model/survey_question_model.dart';

class SurveyAnswerModel {
  String? geoJsonLevelKey;
  String? geoJsonLevelName;
  String? surveyLevelName;
  String? surveyLevelKey;
  String? assignedLevelKey;
  String? assignedLevelName;
  List<Answer>? answers;
  int? aCategory;
  int? sCategory;
  int? gCategory;

  SurveyAnswerModel({
    this.geoJsonLevelKey,
    this.geoJsonLevelName,
    this.surveyLevelName,
    this.surveyLevelKey,
    this.assignedLevelKey,
    this.assignedLevelName,
    this.answers,
    this.aCategory,
    this.sCategory,
    this.gCategory,
  });

  SurveyAnswerModel copyWith({
    String? geoJsonLevelKey,
    String? geoJsonLevelName,
    String? surveyLevelName,
    String? surveyLevelKey,
    String? assignedLevelKey,
    String? assignedLevelName,
    List<Answer>? answers,
    int? aCategory,
    int? sCategory,
    int? gCategory,
  }) =>
      SurveyAnswerModel(
        geoJsonLevelKey: geoJsonLevelKey ?? this.geoJsonLevelKey,
        geoJsonLevelName: geoJsonLevelName ?? this.geoJsonLevelName,
        assignedLevelKey: assignedLevelKey ?? this.assignedLevelKey,
        assignedLevelName: assignedLevelName ?? this.assignedLevelName,
        surveyLevelName: surveyLevelName ?? this.surveyLevelName,
        surveyLevelKey: surveyLevelKey ?? this.surveyLevelKey,
        answers: answers ?? this.answers,
        aCategory: aCategory ?? this.aCategory,
        sCategory: sCategory ?? this.sCategory,
        gCategory: gCategory ?? this.gCategory,
      );
}

class Answer {
  String? id;
  String? answer;
  String? type;
  int? category;
  int? surveyId;
  int? questionId;
  String? question;
  int? typeId;
  List<DItem>? answerOptions;

  Answer(
      {this.id,
      this.answer,
      this.type,
      this.category,
      this.answerOptions,
      this.question,
      this.questionId,
      this.surveyId,
      this.typeId});
}
