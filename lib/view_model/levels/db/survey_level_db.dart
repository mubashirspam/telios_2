import 'dart:developer';


import 'package:isar/isar.dart';
import 'package:telios_2/model/model.dart';

import '../../../settings/settings.dart';

class SurveyLevelDB {
  SurveyLevelDB._();
  static final instance = SurveyLevelDB._();

  Future<void> postSurveyLevelDB(
      List<SurveyLevel>? levels, String levelId) async {
    if (levels == null || levels.isEmpty) {
      return;
    }

    var isar = Isar.getInstance(db);
    final collection = isar!.collection<IsarSurveyLevelModel>();

    final existingLevel = await collection
        .where()
        .filter()
        .geoJsonLevelKeyEqualTo(levelId)
        .findFirst();

    if (existingLevel == null) {
      await isar.writeTxn(() async {
       
        final newLevel = IsarSurveyLevelModel()
          ..geoJsonLevelKey = levelId
          ..geoJsonLevelName = levels.first.geoJsonLevelName
          ..assignedLevelKey = levels.first.assignedLevelKey
          ..assignedLevelName = levels.first.assignedLevelName
          ..levels = levels.map((level) {
             
            return IsarSureveyLevel()
              ..levelName = level.levelName
              ..levelKey = level.levelKey
              ..geoJson = level.geoJson;
          }).toList();

        await collection.put(newLevel);
      });
    } else {
      existingLevel.geoJsonLevelName = levels.first.geoJsonLevelName;
      existingLevel.assignedLevelName = levels.first.assignedLevelName;
      existingLevel.levels = levels.map((level) {
        return IsarSureveyLevel()
          ..levelName = level.levelName
          ..levelKey = level.levelKey
          ..geoJson = level.geoJson;
      }).toList();

      await isar.writeTxn(() async {
        await collection.put(existingLevel);
      });
    }
  }

  Future<List<SurveyLevel>?> fetchSurveyLevelDB(String levelId) async {
    var isar = Isar.getInstance(db);
    final collection = isar!.collection<IsarSurveyLevelModel>();

    final data = await collection
        .where()
        .filter()
        .geoJsonLevelKeyEqualTo(levelId)
        .findFirst();

    if (data != null && data.levels != null) {
      return data.levels!.map((isarLevel) {
        return SurveyLevel(
          assignedLevelKey: data.assignedLevelKey,
          assignedLevelName: data.assignedLevelName,
          geoJsonLevelKey: data.geoJsonLevelKey,
          geoJsonLevelName: data.geoJsonLevelName,
          levelName: isarLevel.levelName,
          levelKey: isarLevel.levelKey,
          geoJson: isarLevel.geoJson,
        );
      }).toList();
    }
    return null;
  }

  Future<bool> deleteSurveyLevelDB() async {
    try {
      var isar = Isar.getInstance(db);
      final collection = isar!.collection<IsarSurveyLevelModel>();
      final data = await collection.where().findAll();

      await isar.writeTxn(() async {
        for (IsarSurveyLevelModel dta in data) {
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
