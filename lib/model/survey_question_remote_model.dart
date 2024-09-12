class SurveyRemoteQuestionModel {
  SurveyQuestionResponse? response;

  SurveyRemoteQuestionModel({
    this.response,
  });

  factory SurveyRemoteQuestionModel.fromJson(Map<String, dynamic> json) =>
      SurveyRemoteQuestionModel(
        response: json["response"] == null
            ? null
            : SurveyQuestionResponse.fromJson(json["response"]),
      );
}

class SurveyQuestionResponse {
  List<SurveyQuestionData>? data;

  SurveyQuestionResponse({
    this.data,
  });

  factory SurveyQuestionResponse.fromJson(Map<String, dynamic> json) =>
      SurveyQuestionResponse(
        data: json["data"] == null
            ? []
            : List<SurveyQuestionData>.from(
                json["data"]!.map((x) => SurveyQuestionData.fromJson(x))),
      );
}

class SurveyQuestionData {
  SurveyQuestionFieldData? fieldData;
  SurveyQuestionPortalData? portalData;

  SurveyQuestionData({
    this.fieldData,
    this.portalData,
  });

  factory SurveyQuestionData.fromJson(Map<String, dynamic> json) =>
      SurveyQuestionData(
        fieldData: json["fieldData"] == null
            ? null
            : SurveyQuestionFieldData.fromJson(json["fieldData"]),
        portalData: json["portalData"] == null
            ? null
            : SurveyQuestionPortalData.fromJson(json["portalData"]),
      );
}

class SurveyQuestionFieldData {
  int? id;
  String? survey;

  SurveyQuestionFieldData({
    this.id,
    this.survey,
  });

  factory SurveyQuestionFieldData.fromJson(Map<String, dynamic> json) =>
      SurveyQuestionFieldData(
        id: json["id"],
        survey: json["survey"],
      );
}

class SurveyQuestionPortalData {
  List<SurveyQuestion>? surveyQuestion;

  SurveyQuestionPortalData({
    this.surveyQuestion,
  });

  factory SurveyQuestionPortalData.fromJson(Map<String, dynamic> json) =>
      SurveyQuestionPortalData(
        surveyQuestion: json["surveyQuestion"] == null
            ? []
            : List<SurveyQuestion>.from(
                json["surveyQuestion"]!.map((x) => SurveyQuestion.fromJson(x))),
      );
}

class SurveyQuestion {
  String? recordId;
  int? surveyQuestionId;
  String? surveyQuestionQuestion;
  int? surveyQuestionQuestionTypeId;
  String? surveyQuestionColor;
  String? surveyVsquestionvsquestionTypeQuestionType;
  String? surveyQuestionIsCounter;
  String? surveyQuestionHint;
  String? modId;

  SurveyQuestion({
    this.recordId,
    this.surveyQuestionId,
    this.surveyQuestionQuestion,
    this.surveyQuestionQuestionTypeId,
    this.surveyQuestionColor,
    this.surveyVsquestionvsquestionTypeQuestionType,
    this.surveyQuestionIsCounter,
    this.surveyQuestionHint,
    this.modId,
  });

  factory SurveyQuestion.fromJson(Map<String, dynamic> json) => SurveyQuestion(
        recordId: json["recordId"],
        surveyQuestionId: json["surveyQuestion::id"],
        surveyQuestionQuestion: json["surveyQuestion::question"],
        surveyQuestionQuestionTypeId: json["surveyQuestion::questionTypeId"],
        surveyQuestionColor: json["surveyQuestion::color"],
        surveyVsquestionvsquestionTypeQuestionType:
            json["surveyVsquestionvsquestionType::questionType"],
        surveyQuestionIsCounter: json["surveyQuestion::isCounter"],
        surveyQuestionHint: json["surveyQuestion::hint"],
        modId: json["modId"],
      );
}
