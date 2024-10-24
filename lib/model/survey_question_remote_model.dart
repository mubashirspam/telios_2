class RemoteQuestionModel {
  QuestionResponse? response;

  RemoteQuestionModel({
    this.response,
  });

  factory RemoteQuestionModel.fromJson(Map<String, dynamic> json) =>
      RemoteQuestionModel(
        response: json["response"] == null
            ? null
            : QuestionResponse.fromJson(json["response"]),
      );
}

class QuestionResponse {
  List<QuestionDatum>? data;

  QuestionResponse({
    this.data,
  });

  factory QuestionResponse.fromJson(Map<String, dynamic> json) =>
      QuestionResponse(
        data: json["data"] == null
            ? []
            : List<QuestionDatum>.from(
                json["data"]!.map((x) => QuestionDatum.fromJson(x))),
      );
}

class QuestionDatum {
  QuestionFieldData? fieldData;
  QuestionPortalData? portalData;

  QuestionDatum({
    this.fieldData,
    this.portalData,
  });

  factory QuestionDatum.fromJson(Map<String, dynamic> json) => QuestionDatum(
        fieldData: json["fieldData"] == null
            ? null
            : QuestionFieldData.fromJson(json["fieldData"]),
        portalData: json["portalData"] == null
            ? null
            : QuestionPortalData.fromJson(json["portalData"]),
      );
}

class QuestionFieldData {
  int? id;
  String? survey;

  QuestionFieldData({
    this.id,
    this.survey,
  });

  factory QuestionFieldData.fromJson(Map<String, dynamic> json) =>
      QuestionFieldData(
        id: json["id"],
        survey: json["survey"],
      );
}

class QuestionPortalData {
  List<SurveyQuestionRemote>? surveyQuestion;
  List<SurveyVssurveyQuestionsVscategoryX>? surveyVssurveyQuestionsVscategoryX;

  QuestionPortalData({
    this.surveyQuestion,
    this.surveyVssurveyQuestionsVscategoryX,
  });

  factory QuestionPortalData.fromJson(Map<String, dynamic> json) =>
      QuestionPortalData(
        surveyQuestion: json["surveyQuestion"] == null
            ? []
            : List<SurveyQuestionRemote>.from(json["surveyQuestion"]!
                .map((x) => SurveyQuestionRemote.fromJson(x))),
        surveyVssurveyQuestionsVscategoryX:
            json["surveyVssurveyQuestionsVscategoryX"] == null
                ? []
                : List<SurveyVssurveyQuestionsVscategoryX>.from(
                    json["surveyVssurveyQuestionsVscategoryX"]!.map(
                        (x) => SurveyVssurveyQuestionsVscategoryX.fromJson(x))),
      );
}

class SurveyQuestionRemote {
  String? recordId;
  int? surveyQuestionId;
  String? surveyQuestionQuestion;
  int? surveyQuestionQuestionTypeId;
  String? surveyVsquestionvsquestionTypeQuestionType;
  String? surveyQuestionHint;
  String? surveyQuestionIsCounter;
  String? surveyVssurveyQuestionsVscategoryCategoryColor;
  String? surveyQuestionParentId;
  String? modId;

  SurveyQuestionRemote({
    this.recordId,
    this.surveyQuestionId,
    this.surveyQuestionQuestion,
    this.surveyQuestionQuestionTypeId,
    this.surveyVsquestionvsquestionTypeQuestionType,
    this.surveyQuestionHint,
    this.surveyQuestionIsCounter,
    this.surveyVssurveyQuestionsVscategoryCategoryColor,
    this.surveyQuestionParentId,
    this.modId,
  });

  factory SurveyQuestionRemote.fromJson(Map<String, dynamic> json) =>
      SurveyQuestionRemote(
        recordId: json["recordId"],
        surveyQuestionId: json["surveyQuestion::id"],
        surveyQuestionQuestion: json["surveyQuestion::question"],
        surveyQuestionQuestionTypeId: json["surveyQuestion::questionTypeId"],
        surveyVsquestionvsquestionTypeQuestionType:
            json["surveyVsquestionvsquestionType::questionType"],
        surveyQuestionHint: json["surveyQuestion::hint"],
        surveyQuestionIsCounter: json["surveyQuestion::isCounter"],
        surveyVssurveyQuestionsVscategoryCategoryColor:
            json["surveyVssurveyQuestionsVscategory::categoryColor"],
        surveyQuestionParentId: json["surveyQuestion::parentId"],
        modId: json["modId"],
      );
}

class SurveyVssurveyQuestionsVscategoryX {
  String? recordId;
  String? surveyVssurveyQuestionsVscategoryXCategoryName;
  String? surveyVssurveyQuestionsVscategoryXCategoryColor;
  String? surveyVssurveyQuestionsVscategoryXQuestionId;
  String? surveyVssurveyQuestionsVscategoryXSurveyId;
  String? modId;

  SurveyVssurveyQuestionsVscategoryX({
    this.recordId,
    this.surveyVssurveyQuestionsVscategoryXCategoryName,
    this.surveyVssurveyQuestionsVscategoryXCategoryColor,
    this.surveyVssurveyQuestionsVscategoryXQuestionId,
    this.surveyVssurveyQuestionsVscategoryXSurveyId,
    this.modId,
  });

  factory SurveyVssurveyQuestionsVscategoryX.fromJson(
          Map<String, dynamic> json) =>
      SurveyVssurveyQuestionsVscategoryX(
        recordId: json["recordId"],
        surveyVssurveyQuestionsVscategoryXCategoryName:
            json["surveyVssurveyQuestionsVscategoryX::categoryName"],
        surveyVssurveyQuestionsVscategoryXCategoryColor:
            json["surveyVssurveyQuestionsVscategoryX::categoryColor"],
        surveyVssurveyQuestionsVscategoryXQuestionId:
            json["surveyVssurveyQuestionsVscategoryX::questionId"],
        surveyVssurveyQuestionsVscategoryXSurveyId:
            json["surveyVssurveyQuestionsVscategoryX::surveyId"],
        modId: json["modId"],
      );
}
