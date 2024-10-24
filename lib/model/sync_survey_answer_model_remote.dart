class SyncSurveyAnswerModelRemote {
  SyncResponse? response;

  SyncSurveyAnswerModelRemote({
    this.response,
  });

  factory SyncSurveyAnswerModelRemote.fromJson(Map<String, dynamic> json) =>
      SyncSurveyAnswerModelRemote(
        response: json["response"] == null
            ? null
            : SyncResponse.fromJson(json["response"]),
      );
}

class SyncResponse {
  List<SyncDatum>? data;

  SyncResponse({
    this.data,
  });

  factory SyncResponse.fromJson(Map<String, dynamic> json) => SyncResponse(
        data: json["data"] == null
            ? []
            : List<SyncDatum>.from(
                json["data"]!.map((x) => SyncDatum.fromJson(x))),
      );
}

class SyncDatum {
  SyncFieldData? fieldData;

  SyncDatum({
    this.fieldData,
  });

  factory SyncDatum.fromJson(Map<String, dynamic> json) => SyncDatum(
        fieldData: json["fieldData"] == null
            ? null
            : SyncFieldData.fromJson(json["fieldData"]),
      );
}

class SyncFieldData {
  int? id;
  int? surveyId;
  String? userId;
  String? unitId;
  String? creationTimestamp;
  String? unitKey;
  String? latestFlag;
  String? unitIdName;
  String? responseJson;

  SyncFieldData({
    this.id,
    this.surveyId,
    this.userId,
    this.unitId,
    this.creationTimestamp,
    this.unitKey,
    this.latestFlag,
    this.unitIdName,
    this.responseJson,
  });

  factory SyncFieldData.fromJson(Map<String, dynamic> json) => SyncFieldData(
        id: json["id"],
        surveyId: json["surveyId"],
        userId: json["userId"],
        unitId: json["unitId"],
        creationTimestamp: json["CreationTimestamp"],
        unitKey: json["unitKey"],
        latestFlag: json["latestFlag"],
        unitIdName: json["unitId_name"],
        responseJson: json["responseJson"],
      );
}
