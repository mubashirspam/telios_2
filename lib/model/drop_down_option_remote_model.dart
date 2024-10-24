class RemoteDropdownOptionsModel {
  DropdownOptionResponse? response;

  RemoteDropdownOptionsModel({
    this.response,
  });

  factory RemoteDropdownOptionsModel.fromJson(Map<String, dynamic> json) =>
      RemoteDropdownOptionsModel(
        response: json["response"] == null
            ? null
            : DropdownOptionResponse.fromJson(json["response"]),
      );
}

class DropdownOptionResponse {
  List<DropdownOptionsDatum>? data;

  DropdownOptionResponse({
    this.data,
  });

  factory DropdownOptionResponse.fromJson(Map<String, dynamic> json) =>
      DropdownOptionResponse(
        data: json["data"] == null
            ? []
            : List<DropdownOptionsDatum>.from(
                json["data"]!.map((x) => DropdownOptionsDatum.fromJson(x))),
      );
}

class DropdownOptionsDatum {
  DropdownFieldData? fieldData;
  DropdownPortalData? portalData;

  DropdownOptionsDatum({
    this.fieldData,
    this.portalData,
  });

  factory DropdownOptionsDatum.fromJson(Map<String, dynamic> json) =>
      DropdownOptionsDatum(
        fieldData: json["fieldData"] == null
            ? null
            : DropdownFieldData.fromJson(json["fieldData"]),
        portalData: json["portalData"] == null
            ? null
            : DropdownPortalData.fromJson(
                json["portalData"],
              ),
      );
}

class DropdownFieldData {
  int? id;
  int? questionId;

  int? answerOptionVsquestionSurveyId;
  String? optionValue;

  DropdownFieldData({
    this.id,
    this.questionId,
    this.optionValue,
    this.answerOptionVsquestionSurveyId,
  });

  factory DropdownFieldData.fromJson(Map<String, dynamic> json) =>
      DropdownFieldData(
        id: json["id"],
        questionId: json["questionId"],
        answerOptionVsquestionSurveyId:
            json["answerOptionVsquestion::surveyId"],
        optionValue: json["optionValue"],
      );
}

class DropdownPortalData {
  List<AnswerOptionsVsself>? answerOptionsVsself;

  DropdownPortalData({
    this.answerOptionsVsself,
  });

  factory DropdownPortalData.fromJson(Map<String, dynamic> json) =>
      DropdownPortalData(
        answerOptionsVsself: json["answerOptionsVsself"] == null
            ? []
            : List<AnswerOptionsVsself>.from(json["answerOptionsVsself"]!
                .map((x) => AnswerOptionsVsself.fromJson(x))),
      );
}

class AnswerOptionsVsself {
  int? answerOptionsVsselfId;
  int? answerOptionsVsselfQuestionId;
  String? answerOptionsVsselfOptionValue;
  String? answerOptionsVsselfOptionValueId;
  String? answerOptionsVsselfParentOptionId;

  AnswerOptionsVsself({
    this.answerOptionsVsselfId,
    this.answerOptionsVsselfQuestionId,
    this.answerOptionsVsselfOptionValue,
    this.answerOptionsVsselfOptionValueId,
    this.answerOptionsVsselfParentOptionId,
  });

  factory AnswerOptionsVsself.fromJson(Map<String, dynamic> json) =>
      AnswerOptionsVsself(
        answerOptionsVsselfId: json["answerOptionsVsself::id"],
        answerOptionsVsselfQuestionId: json["answerOptionsVsself::questionId"],
        answerOptionsVsselfOptionValue:
            json["answerOptionsVsself::optionValue"],
        answerOptionsVsselfOptionValueId:
            json["answerOptionsVsself::optionValueId"],
        answerOptionsVsselfParentOptionId:
            json["answerOptionsVsself::parentOptionId"],
      );
}
