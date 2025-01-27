import 'dart:developer';

import 'package:hive/hive.dart';

import '../../../model/model.dart';
import '../../../settings/helper/get_di.dart';

class SurveyLevelDB {
  SurveyLevelDB._();
  static final instance = SurveyLevelDB._();

  final box = Hive.box<HiveSurveyLevelModel>(HiveBoxes.surveyLevels);

  Future<void> postSurveyLevelDB(
      List<SurveyLevel>? levels, String levelId) async {
    if (levels == null || levels.isEmpty) {
      return;
    }

    // Check if a record with this levelId exists
    final existingLevel = box.get(levelId);

    if (existingLevel == null) {
      final newLevel = HiveSurveyLevelModel()
        ..geoJsonLevelKey = levelId
        ..geoJsonLevelName = levels.first.geoJsonLevelName
        ..assignedLevelKey = levels.first.assignedLevelKey
        ..assignedLevelName = levels.first.assignedLevelName
        ..levels = levels.map((level) {
          return HiveSurveyLevel()
            ..levelName = level.levelName
            ..levelKey = level.levelKey
            ..geoJson = level.geoJson;
        }).toList();

      await box.put(levelId, newLevel);
    } else {
      existingLevel.geoJsonLevelName = levels.first.geoJsonLevelName;
      existingLevel.assignedLevelName = levels.first.assignedLevelName;
      existingLevel.levels = levels.map((level) {
        return HiveSurveyLevel()
          ..levelName = level.levelName
          ..levelKey = level.levelKey
          ..geoJson = level.geoJson;
      }).toList();

      await box.put(levelId, existingLevel);
    }
  }

  Future<void> addmissingLevelDB(SurveyLevel surveyLevel) async {
    try {
      // Get existing data for this geoJsonLevelKey
      final existingData = box.get(surveyLevel.geoJsonLevelKey);

      if (existingData != null) {
        // Check if level with same levelKey already exists
        final levelExists = existingData.levels?.any(
              (level) => level.levelKey == surveyLevel.levelKey,
            ) ??
            false;

        // If level already exists, abort
        if (levelExists) {
          log('Level with key ${surveyLevel.levelKey} already exists. Skipping.', name:"Missing Level");
          return;
        }

        // Create new HiveSurveyLevel
        log('Adding missing level: ${surveyLevel.levelKey}', name:"Missing Level");
        final newLevel = HiveSurveyLevel()
          ..levelName = surveyLevel.levelName
          ..levelKey = surveyLevel.levelKey
          ..geoJson = surveyLevel.geoJson;

        // Add the new level to existing levels
        final updatedLevels = [...?existingData.levels, newLevel];

        // Update the HiveSurveyLevelModel with new levels
        existingData.levels = updatedLevels;

        // Save back to box
        await box.put(surveyLevel.geoJsonLevelKey!, existingData);
      }
    } catch (error) {
      log('Error adding missing level: $error', name:"Missing Level");
    }
  }

  Future<List<SurveyLevel>?> fetchSurveyLevelDB(String levelId) async {
    final data = box.get(levelId);

    if (data != null && data.levels != null) {
      return data.levels!.map((hiveLevel) {
        return SurveyLevel(
          assignedLevelKey: data.assignedLevelKey,
          assignedLevelName: data.assignedLevelName,
          geoJsonLevelKey: data.geoJsonLevelKey,
          geoJsonLevelName: data.geoJsonLevelName,
          levelName: hiveLevel.levelName,
          levelKey: hiveLevel.levelKey,
          geoJson: hiveLevel.geoJson,
        );
      }).toList();
    }
    return null;
  }

  Future<List<LevelInfo>> fetchAllSurveyLevels() async {
    try {
      return box.values
          .expand((model) => model.levels ?? [])
          .map((e) => LevelInfo(
                levelKey: e.levelKey ?? '',
                levelName: e.levelName ?? '',
              ))
          .toList();
    } catch (e) {
      log('Error fetching all survey levels: $e');
      return [];
    }
  }

  Future<bool> deleteSurveyLevelDB() async {
    try {
      await box.clear();
      return true;
    } catch (error) {
      log('Error deleting data: $error');
      return false;
    }
  }
}
