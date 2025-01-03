import 'dart:developer';

import 'package:hive/hive.dart';
import '../../../model/model.dart';
import '../../../settings/helper/get_di.dart';

class AssignedLevelDB {
  AssignedLevelDB._();
  static final instance = AssignedLevelDB._();

  final box = Hive.box<HiveAssignedLevel>(HiveBoxes.assignedLevels);

  Future<void> postAssignedLevel(
      List<AssignedLevel>? levels, String userId) async {
    if (levels == null || levels.isEmpty) {
      return;
    }

    for (AssignedLevel level in levels) {
      // Create a unique key combining userId and levelKey
      final String uniqueKey = '${userId}_${level.levelKey}';

      // Check if the record already exists
      final existingLevel = box.get(uniqueKey);

      if (existingLevel == null) {
        final newLevel = HiveAssignedLevel()
          ..userId = userId
          ..levelKey = level.levelKey
          ..levelName = level.levelName
          ..surveyLevel = level.surveyLevel
          ..assignedLevel = level.assignedLevel
          ..geoJsonLevel = level.geoJsonLevel
          ..geoJsonLevelCount = level.geoJsonLevelCount
          ..assignedLevelId = level.assignedLevelId
          ..unitId = level.unitId
          ..surveyLevelCount = level.surveyLevelCount;

        await box.put(uniqueKey, newLevel);
      } else {
        existingLevel.levelName = level.levelName;
        existingLevel.surveyLevel = level.surveyLevel;
        existingLevel.assignedLevel = level.assignedLevel;
        existingLevel.geoJsonLevel = level.geoJsonLevel;
        existingLevel.geoJsonLevelCount = level.geoJsonLevelCount;
        existingLevel.unitId = level.unitId;
        existingLevel.assignedLevelId = level.assignedLevelId;
        await box.put(uniqueKey, existingLevel);
      }
    }
  }

  Future<List<AssignedLevel>?> fetchAssignedLevel(String userId) async {
    // Filter entries by userId
    final data = box.values.where((level) => level.userId == userId).toList();

    if (data.isNotEmpty) {
      return data.map((hiveLevel) {
        return AssignedLevel(
          levelKey: hiveLevel.levelKey,
          levelName: hiveLevel.levelName,
          surveyLevel: hiveLevel.surveyLevel,
          assignedLevel: hiveLevel.assignedLevel,
          geoJsonLevel: hiveLevel.geoJsonLevel,
          geoJsonLevelCount: hiveLevel.geoJsonLevelCount,
          assignedLevelId: hiveLevel.assignedLevelId,
          unitId: hiveLevel.unitId,
          surveyLevelCount: hiveLevel.surveyLevelCount,
        );
      }).toList();
    }
    return null;
  }

  Future<List<LevelInfo>> fetchAllAssignedLevels() async {
    try {
      return box.values
          .map((e) => LevelInfo(
                levelKey: e.levelKey ?? '',
                levelName: e.levelName ?? '',
              ))
          .toList();
    } catch (e) {
      log('Error fetching all assigned levels: $e');
      return [];
    }
  }

  Future<bool> deleteAssignedLevel() async {
    try {
      await box.clear();
      return true;
    } catch (error) {
      log('Error deleting data: $error');
      return false;
    }
  }
}
