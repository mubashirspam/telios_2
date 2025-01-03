
import 'dart:developer';

import 'package:hive/hive.dart';

import '../../../model/model.dart';
import '../../../settings/helper/get_di.dart';

class MapLevelDB {
  MapLevelDB._();
  static final instance = MapLevelDB._();

  final box = Hive.box<HiveMapLevelModel>(HiveBoxes.mapLevels);

  Future<void> postMapLevelDB(List<MapLevel>? levels, String levelId) async {
    if (levels == null || levels.isEmpty) {
      return;
    }

    // Check if a record with this levelId already exists
    final existingLevel = box.get(levelId);

    if (existingLevel == null) {
      final newLevel = HiveMapLevelModel()
        ..assignedLevelKey = levelId
        ..assignedLevelName = levels.first.assignedLevelName
        ..levels = levels.map((level) {
          return HiveMapLevel()
            ..levelName = level.levelName
            ..levelKey = level.levelKey
            ..surveyLevelCount = level.surveyLevelCount
            ..geoJson = level.geoJson;
        }).toList();

      await box.put(levelId, newLevel);
    } else {
      existingLevel.assignedLevelName = levels.first.assignedLevelName;
      existingLevel.levels = levels.map((level) {
        return HiveMapLevel()
          ..levelName = level.levelName
          ..levelKey = level.levelKey
          ..surveyLevelCount = level.surveyLevelCount
          ..geoJson = level.geoJson;
      }).toList();

      await box.put(levelId, existingLevel);
    }
  }

  Future<void> updateSurveyLevelCount(
      int count, String levelId, String assignedLevelKey) async {
    // Get the model with the matching assignedLevelKey
    final existingLevel = box.get(assignedLevelKey);

    if (existingLevel != null && existingLevel.levels != null) {
      // Find and update the specific level using levelId
      final updatedLevels = existingLevel.levels!.map((l) {
        if (l.levelKey == levelId) {
          // Create a new instance with updated count
          return HiveMapLevel()
            ..levelName = l.levelName
            ..levelKey = l.levelKey
            ..surveyLevelCount = count
            ..geoJson = l.geoJson;
        }
        return l;
      }).toList();

      // Create updated model
      final updatedModel = HiveMapLevelModel()
        ..assignedLevelKey = existingLevel.assignedLevelKey
        ..assignedLevelName = existingLevel.assignedLevelName
        ..levels = updatedLevels;

      // Save the updated model
      await box.put(assignedLevelKey, updatedModel);
    }
  }

  Future<List<MapLevel>?> fetchMapLevelDB(String levelId) async {
    final data = box.get(levelId);

    if (data != null && data.levels != null) {
      return data.levels!.map((hiveLevel) {
        return MapLevel(
          assignedLevelKey: data.assignedLevelKey,
          assignedLevelName: data.assignedLevelName,
          levelName: hiveLevel.levelName,
          levelKey: hiveLevel.levelKey,
          surveyLevelCount: hiveLevel.surveyLevelCount,
          geoJson: hiveLevel.geoJson,
        );
      }).toList();
    }
    return null;
  }

  Future<List<LevelInfo>> fetchAllMapLevels() async {
    try {
      return box.values
          .expand((model) => model.levels ?? [])
          .map((e) => LevelInfo(
                levelKey: e.levelKey ?? '',
                levelName: e.levelName ?? '',
              ))
          .toList();
    } catch (e) {
      log('Error fetching all map levels: $e');
      return [];
    }
  }

  Future<bool> deleteMapLevelDB() async {
    try {
      await box.clear();
      return true;
    } catch (error) {
      log('Error deleting data: $error');
      return false;
    }
  }
}
