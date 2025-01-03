class PostSurveyResponseModel {
  PostSurveyResponse? response;

  PostSurveyResponseModel({
    this.response,
  });

  factory PostSurveyResponseModel.fromJson(Map<String, dynamic> json) =>
      PostSurveyResponseModel(
        response: json["response"] == null
            ? null
            : PostSurveyResponse.fromJson(json["response"]),
      );
}

class PostSurveyResponse {
  List<PostSurveyDatum>? data;

  PostSurveyResponse({
    this.data,
  });

  factory PostSurveyResponse.fromJson(Map<String, dynamic> json) =>
      PostSurveyResponse(
        data: json["data"] == null
            ? []
            : List<PostSurveyDatum>.from(
                json["data"]!.map((x) => PostSurveyDatum.fromJson(x))),
      );
}

class PostSurveyDatum {
  PostSurveyFieldData? fieldData;

  PostSurveyDatum({
    this.fieldData,
  });

  factory PostSurveyDatum.fromJson(Map<String, dynamic> json) =>
      PostSurveyDatum(
        fieldData: json["fieldData"] == null
            ? null
            : PostSurveyFieldData.fromJson(json["fieldData"]),
      );
}

class PostSurveyFieldData {
  String? personIdFk;

  String? alert;

  PostSurveyFieldData({
    this.personIdFk,
    this.alert,
  });

  factory PostSurveyFieldData.fromJson(Map<String, dynamic> json) =>
      PostSurveyFieldData(
        personIdFk: json["personIdFk"],
        alert: json["Alert"],
      );
}
