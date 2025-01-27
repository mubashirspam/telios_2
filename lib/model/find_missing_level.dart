class FindMissingLevel {
  Response? response;

  FindMissingLevel({
    this.response,
  });

  factory FindMissingLevel.fromJson(Map<String, dynamic> json) =>
      FindMissingLevel(
        response: json["response"] == null
            ? null
            : Response.fromJson(json["response"]),
      );
}

class Response {
  List<Datum>? data;

  Response({
    this.data,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );
}

class Datum {
  FieldData? fieldData;
  PortalData? portalData;

  Datum({
    this.fieldData,
    this.portalData,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        fieldData: json["fieldData"] == null
            ? null
            : FieldData.fromJson(json["fieldData"]),
        portalData: json["portalData"] == null
            ? null
            : PortalData.fromJson(json["portalData"]),
      );
}

class FieldData {
  String? levelKey;

  FieldData({
    this.levelKey,
  });

  factory FieldData.fromJson(Map<String, dynamic> json) => FieldData(
        levelKey: json["levelKey"],
      );
}

class PortalData {
  List<Unitselfparent2>? unitselfparent2;

  PortalData({
    this.unitselfparent2,
  });

  factory PortalData.fromJson(Map<String, dynamic> json) => PortalData(
        unitselfparent2: json["Unitselfparent 2"] == null
            ? []
            : List<Unitselfparent2>.from(json["Unitselfparent 2"]!
                .map((x) => Unitselfparent2.fromJson(x))),
      );

 
}

class Unitselfparent2 {
  String? unitselfparent2LevelKey;
  String? unitselfparent2Unit;

  Unitselfparent2({
    this.unitselfparent2LevelKey,
    this.unitselfparent2Unit,
  });

  factory Unitselfparent2.fromJson(Map<String, dynamic> json) =>
      Unitselfparent2(
        unitselfparent2LevelKey: json["Unitselfparent 2::levelKey"],
        unitselfparent2Unit: json["Unitselfparent 2::unit"],
      );
}
