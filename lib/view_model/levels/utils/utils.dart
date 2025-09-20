import 'dart:convert';
import 'dart:developer';

import '../../../model/find_missing_level.dart';
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

List<SurveyLevel> convertMissingRemoteToLocal({
  required FindMissingLevel remoteData,
  required String assignedLevelId,
}) {
  final data = remoteData.response?.data;

  if (data == null || data.isEmpty) return [];

  List<SurveyLevel> result = [];

  for (var e in data) {
    final mapLevelKey = e.fieldData?.levelKey;
    final portal = e.portalData!.unitselfparent2;
    
    if (mapLevelKey == null || 
        mapLevelKey.isEmpty || 
        portal == null || 
        portal.isEmpty) {
      continue;
    }

    for (var p in portal) {
      result.add(
        SurveyLevel(
          levelName: p.unitselfparent2Unit,
          levelKey: p.unitselfparent2LevelKey,
          assignedLevelKey: assignedLevelId,
          assignedLevelName: '',
          geoJsonLevelKey: mapLevelKey,
          geoJsonLevelName: '',
        ),
      );
    }
  }

  return result;
}



/// Converts a GeoJSON string to a list of [SurveyLevel].
///
/// [geoJson] is the string representation of the GeoJSON data.
Future<List<SurveyLevel>> convertGeojsontoSurveyLevel(
    MapLevel level, int id) async {
  log('🗺️ convertGeojsontoSurveyLevel - START');
  log('📊 Parameters: levelKey=${level.levelKey}, assignedLevelKey=${level.assignedLevelKey}, id=$id');
  
  final geoJson = level.geoJson;
  if (geoJson == null || level.assignedLevelKey == null) {
    log('❌ GeoJSON or assignedLevelKey is null');
    return [];
  }

  log('📝 GeoJSON length: ${geoJson.length} characters');
  log('📝 GeoJSON preview: ${geoJson.length > 100 ? geoJson.substring(0, 100) + "..." : geoJson}');

  try {
    log('🔄 Parsing GeoJSON...');
    
    // First, let's parse the raw JSON to see its structure
    final Map<String, dynamic> rawJson = json.decode(geoJson);
    log('📊 Raw JSON keys: ${rawJson.keys.toList()}');
    log('📊 Raw JSON type: ${rawJson["type"]}');
    log('📊 Raw JSON name: ${rawJson["name"]}');
    log('📊 Features type: ${rawJson["features"]?.runtimeType}');
    log('📊 Features length: ${rawJson["features"]?.length}');
    
    // Check if features is actually a list
    if (rawJson["features"] != null) {
      final featuresData = rawJson["features"];
      if (featuresData is List) {
        log('✅ Features is a valid List with ${featuresData.length} items');
        if (featuresData.isNotEmpty) {
          log('📊 First feature keys: ${featuresData[0]?.keys.toList()}');
          log('📊 First feature type: ${featuresData[0]?["type"]}');
        }
      } else {
        log('❌ Features is not a List, it is: ${featuresData.runtimeType}');
        log('❌ Features content: $featuresData');
        return [];
      }
    } else {
      log('❌ Features is null in JSON');
      return [];
    }
    
    final geoMapModel = geoMapModelFromJson(geoJson);
    log('✅ GeoJSON parsed successfully');
    
    final features = geoMapModel.features;
    log('📊 Features from parsed model: ${features?.length ?? 'null'}');
    
    if (features == null) {
      log('❌ Features is null after parsing');
      return [];
    }
    
    if (features.isEmpty) {
      log('❌ Features array is empty');
      return [];
    }

    log('✅ Found ${features.length} features, processing...');
    
    List<SurveyLevel> surveyLevels = [];
    
    for (int i = 0; i < features.length; i++) {
      final feature = features[i];
      log('🔄 Processing feature $i/${features.length}');
      log('📍 Feature type: ${feature.type}');
      log('📍 Feature properties: ${feature.properties != null ? "exists" : "null"}');
      log('📍 Feature geometry: ${feature.geometry != null ? "exists" : "null"}');
      
      final p = feature.properties;
      if (p == null) {
        log('⚠️ Feature $i has null properties, skipping');
        continue;
      }
      
      log('📊 Properties details: level1=${p.level1}, level2=${p.level2}, level3=${p.level3}, level4=${p.level4}');
      log('📊 Properties IDs: level1Id=${p.level1Id}, level2Id=${p.level2Id}, level3Id=${p.level3Id}, level4Id=${p.level4Id}');

      String geoJsonLevelName = '';
      String levelName = '';
      String levelKey = '';
      String assignedLevelKey = level.assignedLevelKey!;
      String assignedLevelName = level.assignedLevelName ?? '';

      log('⚙️ Processing with id=$id');
      switch (id) {
        case 1:
          geoJsonLevelName = p.level1 ?? "";
          levelName = p.level2 ?? "";
          levelKey = p.level2Id ?? "";
          log('✅ Case 1: geoJsonLevelName=$geoJsonLevelName, levelName=$levelName, levelKey=$levelKey');
          break;
        case 2:
          geoJsonLevelName = p.level2 ?? "";
          levelName = p.level3 ?? "";
          levelKey = p.level3Id ?? "";
          log('✅ Case 2: geoJsonLevelName=$geoJsonLevelName, levelName=$levelName, levelKey=$levelKey');
          break;
        case 3:
          geoJsonLevelName = p.level3 ?? "";
          levelName = p.level4 ?? "";
          levelKey = p.level4Id ?? "";
          log('✅ Case 3: geoJsonLevelName=$geoJsonLevelName, levelName=$levelName, levelKey=$levelKey');
          break;
        // Add more cases as needed
        default:
          geoJsonLevelName = p.level3 ?? "";
          levelName = p.level4 ?? "";
          levelKey = p.level4Id ?? "";
          log('✅ Default case: geoJsonLevelName=$geoJsonLevelName, levelName=$levelName, levelKey=$levelKey');
          break;
      }

      final surveyLevel = SurveyLevel(
        // geoJsonLevelKey: geoJsonLevelKey,
        geoJsonLevelName: geoJsonLevelName,
        levelName: levelName,
        levelKey: levelKey,
        assignedLevelKey: assignedLevelKey,
        assignedLevelName: assignedLevelName,
        geoJson: '',
      );
      
      surveyLevels.add(surveyLevel);
      log('✅ Added survey level: ${surveyLevel.levelName} (${surveyLevel.levelKey})');
    }
    
    log('🎉 convertGeojsontoSurveyLevel completed successfully: ${surveyLevels.length} survey levels created');
    return surveyLevels;
    
  } catch (e) {
    log('💥 Error parsing GeoJSON: ${e.toString()}');
    log('📍 Error type: ${e.runtimeType}');
    log('📍 Stack trace: ${StackTrace.current}');
    return [];
  }
}
