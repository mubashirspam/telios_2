import 'survey_question_model.dart';

class SyncSurveyAnswerModel {
  String? levelKey;
  String? assignedLevelKey;
  String? levelName;
  List<ResponseAnswer>? answers;

  SyncSurveyAnswerModel({
    this.levelKey,
    this.assignedLevelKey,
    this.levelName,
    this.answers,
  });
}

class ResponseAnswer {
  int? questionId;
  String? answer;
  List<DItem>? answerOptions;
  ResponseAnswer({
    this.questionId,
    this.answer,
    this.answerOptions,
  });
}
