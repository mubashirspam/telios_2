class RemoteAssignedLeveleModel {
  AssignedResponse? response;

  RemoteAssignedLeveleModel({
    this.response,
  });

  factory RemoteAssignedLeveleModel.fromJson(Map<String, dynamic> json) =>
      RemoteAssignedLeveleModel(
        response: json["response"] == null
            ? null
            : AssignedResponse.fromJson(json["response"]),
      );
}

class AssignedResponse {
  List<AssignedDatum>? data;

  AssignedResponse({
    this.data,
  });

  factory AssignedResponse.fromJson(Map<String, dynamic> json) =>
      AssignedResponse(
        data: json["data"] == null
            ? []
            : List<AssignedDatum>.from(
                json["data"]!.map((x) => AssignedDatum.fromJson(x))),
      );
}

class AssignedDatum {
  AssignedPortalData? portalData;

  AssignedDatum({
    this.portalData,
  });

  factory AssignedDatum.fromJson(Map<String, dynamic> json) => AssignedDatum(
        portalData: json["portalData"] == null
            ? null
            : AssignedPortalData.fromJson(json["portalData"]),
      );
}

class AssignedPortalData {
  List<DataObject>? dataObject;

  AssignedPortalData({
    this.dataObject,
  });

  factory AssignedPortalData.fromJson(Map<String, dynamic> json) =>
      AssignedPortalData(
        dataObject: json["userVsTelios_Assignmentuserid"] == null
            ? []
            : List<DataObject>.from(json["userVsTelios_Assignmentuserid"]!
                .map((x) => DataObject.fromJson(x))),
      );
}

class DataObject {
  String? dataObjectUnitId;
  String? dataObjectSurveyLevel;
  String? dataObjectUserAssingLevel;
  String? dataObjectGeoJsonLevel;
  String? userVsAssignVsTeliosUnitLevelKey;
  String? userVsAssignVsTeliosUnitUnit;
  int? dataObjectGeojsonLevelCount;
  int? dataObjectSurveyLevelCount;
  int? assignedLevelId;

  DataObject({
    this.dataObjectSurveyLevel,
    this.dataObjectUserAssingLevel,
    this.dataObjectGeoJsonLevel,
    this.userVsAssignVsTeliosUnitLevelKey,
    this.userVsAssignVsTeliosUnitUnit,
    this.dataObjectGeojsonLevelCount,
    this.dataObjectSurveyLevelCount,
    this.assignedLevelId,
    this.dataObjectUnitId,
  });

  factory DataObject.fromJson(Map<String, dynamic> json) => DataObject(
        dataObjectUnitId:
            json["userVsTelios_Assignmentuserid::unitId"],
        assignedLevelId: json["userVsTelios_Assignmentuserid::geoJsonLevelId"],
        dataObjectSurveyLevel:
            json["userVsTelios_Assignmentuserid::surveyLevel"],
        dataObjectUserAssingLevel:
            json["userVsTelios_Assignmentuserid::userAssingLevel"],
        dataObjectGeoJsonLevel:
            json["userVsTelios_Assignmentuserid::geoJsonLevel"],
        userVsAssignVsTeliosUnitLevelKey:
            json["userVsAssignVsTelios_Unit::levelKey"],
        userVsAssignVsTeliosUnitUnit: json["userVsAssignVsTelios_Unit::unit"],
        dataObjectGeojsonLevelCount:
            json["userVsTelios_Assignmentuserid::geojsonLevelCount"],
        dataObjectSurveyLevelCount:
            json["userVsTelios_Assignmentuserid::surveyLevelCount"],
      );
}
