class RemoteMapLevelModel {
  MapResponse? response;

  RemoteMapLevelModel({
    this.response,
  });

  factory RemoteMapLevelModel.fromJson(Map<String, dynamic> json) =>
      RemoteMapLevelModel(
        response: json["response"] == null
            ? null
            : MapResponse.fromJson(json["response"]),
      );
}

class MapResponse {
  List<MapDatum>? data;

  MapResponse({
    this.data,
  });

  factory MapResponse.fromJson(Map<String, dynamic> json) => MapResponse(
        data: json["data"] == null
            ? []
            : List<MapDatum>.from(
                json["data"]!.map((x) => MapDatum.fromJson(x))),
      );
}

class MapDatum {
  MapFieldData? fieldData;
  MapPortalData? portalData;

  MapDatum({
    this.fieldData,
    this.portalData,
  });

  factory MapDatum.fromJson(Map<String, dynamic> json) => MapDatum(
        fieldData: json["fieldData"] == null
            ? null
            : MapFieldData.fromJson(json["fieldData"]),
        portalData: json["portalData"] == null
            ? null
            : MapPortalData.fromJson(json["portalData"]),
      );
}

class MapFieldData {
  String? id;
  String? levelKey;
  String? countryId;
  String? countryLevelId;
  String? numNextLevel;
  String? unit;

  MapFieldData({
    this.id,
    this.levelKey,
    this.countryId,
    this.countryLevelId,
    this.numNextLevel,
    this.unit,
  });

  factory MapFieldData.fromJson(Map<String, dynamic> json) => MapFieldData(
        id: json["id"],
        levelKey: json["levelKey"],
        countryId: json["countryId"],
        countryLevelId: json["countryLevelId"],
        numNextLevel: json["numNextLevel"],
        unit: json["unit"],
      );
}

class MapPortalData {
  List<UnitFetchVsunit>? unitFetchVsunits;

  MapPortalData({
    this.unitFetchVsunits,
  });

  factory MapPortalData.fromJson(Map<String, dynamic> json) => MapPortalData(
        unitFetchVsunits: json["unitFetchVsunits"] == null
            ? []
            : List<UnitFetchVsunit>.from(json["unitFetchVsunits"]!
                .map((x) => UnitFetchVsunit.fromJson(x))),
      );
}

// class Unitselfparent {
//   String? recordId;
//   String? unitselfparentId;
//   String? unitselfparentLevelKey;
//   String? unitselfparentUnit;
//   String? unitselfparentCountryLevelId;
//   String? unitselfparentNumNextLevel;
//   String? unitGeoJsonidGeoJson;
//   String? modId;

//   Unitselfparent({
//     this.recordId,
//     this.unitselfparentId,
//     this.unitselfparentLevelKey,
//     this.unitselfparentUnit,
//     this.unitselfparentCountryLevelId,
//     this.unitselfparentNumNextLevel,
//     this.unitGeoJsonidGeoJson,
//     this.modId,
//   });

//   factory Unitselfparent.fromJson(Map<String, dynamic> json) => Unitselfparent(
//         recordId: json["recordId"],
//         unitselfparentId: json["Unitselfparent ::id"],
//         unitselfparentLevelKey: json["Unitselfparent ::levelKey"],
//         unitselfparentUnit: json["Unitselfparent ::unit"],
//         unitselfparentCountryLevelId: json["Unitselfparent ::countryLevelId"],
//         unitselfparentNumNextLevel: json["Unitselfparent ::numNextLevel"],
//         unitGeoJsonidGeoJson: json["unitGeoJsonid::geoJson"],
//         modId: json["modId"],
//       );
// }

class UnitFetchVsunit {
  String? recordId;
  String? unitFetchVsunitsId;
  String? unitFetchVsunitsLevelKey;
  String? unitFetchVsunitsUnit;
  String? unitFetchVsunitsNumNextLevel;
  String? unitFetchVsunitsCountryLevelId;
  String? unitfetchVsGeoJsonidGeoJson;
  String? modId;

  UnitFetchVsunit({
    this.recordId,
    this.unitFetchVsunitsId,
    this.unitFetchVsunitsLevelKey,
    this.unitFetchVsunitsUnit,
    this.unitFetchVsunitsNumNextLevel,
    this.unitFetchVsunitsCountryLevelId,
    this.unitfetchVsGeoJsonidGeoJson,
    this.modId,
  });

  factory UnitFetchVsunit.fromJson(Map<String, dynamic> json) =>
      UnitFetchVsunit(
        recordId: json["recordId"],
        unitFetchVsunitsId: json["unitFetchVsunits::id"],
        unitFetchVsunitsLevelKey: json["unitFetchVsunits::levelKey"],
        unitFetchVsunitsUnit: json["unitFetchVsunits::unit"],
        unitFetchVsunitsNumNextLevel: json["unitFetchVsunits::numNextLevel"],
        unitFetchVsunitsCountryLevelId:
            json["unitFetchVsunits::countryLevelId"],
        unitfetchVsGeoJsonidGeoJson: json["unitfetchVsGeoJsonid::geoJson"],
        modId: json["modId"],
      );
}
