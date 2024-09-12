import 'dart:developer';
import 'package:isar/isar.dart';
import 'package:telios_2/model/model.dart';

import '../../../settings/settings.dart';

class MapLevelDB {
  MapLevelDB._();
  static final instance = MapLevelDB._();

  Future<void> postMapLevelDB(List<MapLevel>? levels, String levelId) async {
    if (levels == null || levels.isEmpty) {
      return;
    }

    var isar = Isar.getInstance(db);
    final collection = isar!.collection<IsarMapLevelModel>();

    final existingLevel = await collection
        .where()
        .filter()
        .assignedLevelKeyEqualTo(levelId)
        .findFirst();

    if (existingLevel == null) {
      await isar.writeTxn(() async {
        final newLevel = IsarMapLevelModel()
          ..assignedLevelKey = levelId
          ..assignedLevelName = levels.first.assignedLevelName
          ..levels = levels.map((level) {
            return IsarMapLevel()
              ..levelName = level.levelName
              ..levelKey = level.levelKey
              ..surveyLevelCount = level.surveyLevelCount
              ..geoJson = level.geoJson;
          }).toList();

        await collection.put(newLevel);
      });
    } else {
      existingLevel.assignedLevelName = levels.first.assignedLevelName;
      existingLevel.levels = levels.map((level) {
        return IsarMapLevel()
          ..levelName = level.levelName
          ..levelKey = level.levelKey
          ..surveyLevelCount = level.surveyLevelCount
          ..geoJson = level.geoJson;
      }).toList();

      await isar.writeTxn(() async {
        await collection.put(existingLevel);
      });
    }
  }

Future<void> updateSurveyLevelCount(
    int count, String levelId, String assignedLevelKey) async {
  var isar = Isar.getInstance(db);
  final collection = isar!.collection<IsarMapLevelModel>();

  // Find the IsarMapLevelModel with the matching assignedLevelKey
  final existingLevel = await collection
      .where()
      .filter()
      .assignedLevelKeyEqualTo(assignedLevelKey)
      .findFirst();

  if (existingLevel != null && existingLevel.levels != null) {
    // Find the specific IsarMapLevel using levelId (assumed to be levelKey)
    final updatedLevels = existingLevel.levels!.map((l) {
      if (l.levelKey == levelId) {
        // Update the surveyLevelCount of the matching level
        return l.copyWith(surveyLevelCount: count);
      }
      return l;
    }).toList();

    // Update the IsarMapLevelModel with the modified levels
    final updatedModel = existingLevel.copyWith(levels: updatedLevels);

    // Perform the write transaction to update the database
    await isar.writeTxn(() async {
      await collection.put(updatedModel);
    });
  }
}




  Future<List<MapLevel>?> fetchMapLevelDB(String levelId) async {
    var isar = Isar.getInstance(db);
    final collection = isar!.collection<IsarMapLevelModel>();

    final data = await collection
        .where()
        .filter()
        .assignedLevelKeyEqualTo(levelId)
        .findFirst();

    if (data != null && data.levels != null) {
      return data.levels!.map((isarLevel) {
        return MapLevel(
          assignedLevelKey: data.assignedLevelKey,
          assignedLevelName: data.assignedLevelName,
          levelName: isarLevel.levelName,
          levelKey: isarLevel.levelKey,
          surveyLevelCount: isarLevel.surveyLevelCount,
          geoJson: isarLevel.geoJson,
        );
      }).toList();
    }
    return null;
  }

  Future<bool> deleteMapLevelDB() async {
    try {
      var isar = Isar.getInstance(db);
      final collection = isar!.collection<IsarMapLevelModel>();
      final data = await collection.where().findAll();

      await isar.writeTxn(() async {
        for (IsarMapLevelModel dta in data) {
          await collection.delete(dta.id);
        }
      });
      return true;
    } catch (error) {
      log('Error deleting data: $error');
      return false;
    }
  }
}
