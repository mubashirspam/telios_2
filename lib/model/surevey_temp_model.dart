import 'package:telios_2/model/survey_question_model.dart';

class SurveyTempModel {
  final List<SurveyTemp>? surveyTemp;

  SurveyTempModel({
    this.surveyTemp,
  });
}

class SurveyTemp {
  final String? surveyLevelName;
  final String? surveyLevelKey;
  final String? assignedLevelKey;
  final String? assignedLevelName;
  final String? geoJsonLevelKey;
  final String? geoJsonLevelName;
  final List<SurveyTempAnswers>? answers;

  SurveyTemp({
    this.surveyLevelName,
    this.surveyLevelKey,
    this.assignedLevelKey,
    this.assignedLevelName,
    this.geoJsonLevelKey,
    this.geoJsonLevelName,
    this.answers,
  });
}

class SurveyTempAnswers {
  final int? surveyId;
  final int? questionId;
  final String? question;
  final int? typeId;
  final String? answer;
  final List<DItem>? answerOptions;

  SurveyTempAnswers({
    this.surveyId,
    this.questionId,
    this.question,
    this.typeId,
    this.answer,
    this.answerOptions,
  });
}
