import 'package:flutter/material.dart';

import '../../../model/model.dart';

/// Converts a list of [DataObject] from remote data to a list of [AssignedLevel] for local use.
///
/// [userId] is the ID of the user associated with the levels.
/// [remoteData] is the list of data objects fetched from the remote source.
List<AssignedLevel> convertAssignedRemoteToLocal({
  required String userId,
  required List<DataObject> remoteData,
}) {
  return remoteData.map((dataObject) {
    return AssignedLevel(
      userId: userId,
      levelName: dataObject.userVsAssignVsTeliosUnitUnit,
      levelKey: dataObject.userVsAssignVsTeliosUnitLevelKey,
      assignedLevel: dataObject.dataObjectUserAssingLevel,
      surveyLevel: dataObject.dataObjectSurveyLevel,
      geoJsonLevel: dataObject.dataObjectGeoJsonLevel,
      geoJsonLevelCount: dataObject.dataObjectGeojsonLevelCount,
      surveyLevelCount: dataObject.dataObjectSurveyLevelCount,
      assignedLevelId: dataObject.assignedLevelId,
      unitId: dataObject.dataObjectUnitId,
    );
  }).toList();
}

/// Converts [RemoteMapLevelModel] data to a list of [MapLevel] for local use.
///
/// [remoteData] is the data model fetched from the remote source.
List<MapLevel> convertMapLevelRemoteToLocal({
  required RemoteMapLevelModel remoteData,
  required String assignedLevelId,
}) {
  final fieldData = remoteData.response!.data!.first.fieldData!;
  final portalData =
      remoteData.response!.data!.first.portalData!.unitFetchVsunits;

  return portalData!.map((portal) {
    return MapLevel(
      levelName: portal.unitFetchVsunitsUnit,
      levelKey: portal.unitFetchVsunitsLevelKey,
      geoJson: portal.unitfetchVsGeoJsonidGeoJson,
      assignedLevelKey: assignedLevelId,
      assignedLevelName: fieldData.unit,
      surveyLevelCount:
          int.tryParse(portal.unitFetchVsunitsNumNextLevel ?? '0'),
    );
  }).toList();
}

/// Converts a GeoJSON string to a list of [SurveyLevel].
///
/// [geoJson] is the string representation of the GeoJSON data.
Future<List<SurveyLevel>> convertGeojsontoSurveyLevel(
    MapLevel level, int id) async {
  final geoJson = level.geoJson;
  if (geoJson == null || level.assignedLevelKey == null) {
    return [];
  }

  final features = geoMapModelFromJson(geoJson).features;

  if (features != null && features.isNotEmpty) {
    return features.map((feature) {
      final p = feature.properties;

      String geoJsonLevelName = '';
      String levelName = '';
      String levelKey = '';
      String assignedLevelKey = level.assignedLevelKey!;
      String assignedLevelName = level.assignedLevelName ?? '';

      debugPrint(level.assignedLevelKey);
      debugPrint(level.assignedLevelName);

      switch (id) {
        case 1:
          geoJsonLevelName = p?.level1 ?? "";
          levelName = p?.level2 ?? "";
          levelKey = p?.level2Id ?? "";

          break;
        case 2:
          geoJsonLevelName = p?.level2 ?? "";
          levelName = p?.level3 ?? "";
          levelKey = p?.level3Id ?? "";

          break;
        case 3:
          geoJsonLevelName = p?.level3 ?? "";
          levelName = p?.level4 ?? "";
          levelKey = p?.level4Id ?? "";

          break;
        // Add more cases as needed
        default:
          geoJsonLevelName = p?.level3 ?? "";
          levelName = p?.level4 ?? "";
          levelKey = p?.level4Id ?? "";

          break;
      }

      return SurveyLevel(
        // geoJsonLevelKey: geoJsonLevelKey,
        geoJsonLevelName: geoJsonLevelName,
        levelName: levelName,
        levelKey: levelKey,
        assignedLevelKey: assignedLevelKey,
        assignedLevelName: assignedLevelName,
        geoJson: '',
      );
    }).toList();
  }

  return [];
}
