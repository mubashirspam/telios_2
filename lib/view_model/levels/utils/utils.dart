

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
      assignedLevelId: dataObject.assignedLevelId 
    );
  }).toList();
}

/// Converts [RemoteMapLevelModel] data to a list of [MapLevel] for local use.
///
/// [remoteData] is the data model fetched from the remote source.
List<MapLevel> convertMapLevelRemoteToLocal({
  required RemoteMapLevelModel remoteData,
}) {
  final fieldData = remoteData.response!.data!.first.fieldData!;
  final portalData =
      remoteData.response!.data!.first.portalData!.unitselfparent;

  return portalData!.map((portal) {
    return MapLevel(
      levelName: portal.unitselfparentUnit,
      levelKey: portal.unitselfparentLevelKey,
      geoJson: portal.unitGeoJsonidGeoJson,
      assignedLevelKey: fieldData.levelKey,
      assignedLevelName: fieldData.unit,
      surveyLevelCount: int.tryParse(portal.unitselfparentNumNextLevel ?? '0'),
    );
  }).toList();
}

/// Converts a GeoJSON string to a list of [SurveyLevel].
///
/// [geoJson] is the string representation of the GeoJSON data.
Future<List<SurveyLevel>> convertGeojsontoSurveyLevel(
    String geoJson, int id) async {
  final features = geoMapModelFromJson(geoJson).features;

  if (features != null && features.isNotEmpty) {
    return features.map((feature) {
      final p = feature.properties;

      String geoJsonLevelKey = '';
      String geoJsonLevelName = '';
      String levelName = '';
      String levelKey = '';
      String assignedLevelKey = '';
      String assignedLevelName = '';

      switch (id) {
        case 1:
          geoJsonLevelKey = p?.level1Id ?? "";
          geoJsonLevelName = p?.level1 ?? "";
          levelName = p?.level2 ?? "";
          levelKey = p?.level2Id ?? "";
          assignedLevelKey = p?.level0Id ?? "";
          assignedLevelName = p?.level0 ?? "";
          break;
        case 2:
          geoJsonLevelKey = p?.level2Id ?? "";
          geoJsonLevelName = p?.level2 ?? "";
          levelName = p?.level3 ?? "";
          levelKey = p?.level3Id ?? "";
          assignedLevelKey = p?.level1Id ?? "";
          assignedLevelName = p?.level1 ?? "";
          break;
        case 3:
          geoJsonLevelKey = p?.level3Id ?? "";
          geoJsonLevelName = p?.level3 ?? "";
          levelName = p?.level4 ?? "";
          levelKey = p?.level4Id ?? "";
          assignedLevelKey = p?.level2Id ?? "";
          assignedLevelName = p?.level2 ?? "";
          break;
        // Add more cases as needed
        default:
          geoJsonLevelKey = p?.level3Id ?? "";
          geoJsonLevelName = p?.level3 ?? "";
          levelName = p?.level4 ?? "";
          levelKey = p?.level4Id ?? "";
          assignedLevelKey = p?.level2Id ?? "";
          assignedLevelName = p?.level2 ?? "";
          break;
      }

      return SurveyLevel(
        geoJsonLevelKey: geoJsonLevelKey,
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
