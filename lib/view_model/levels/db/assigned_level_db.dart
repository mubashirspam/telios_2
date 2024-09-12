import 'dart:developer';
import 'package:isar/isar.dart';
import 'package:telios_2/model/model.dart';
import '../../../settings/settings.dart';

class AssignedLevelDB {
  AssignedLevelDB._();
  static final instance = AssignedLevelDB._();

  Future<void> postAssignedLevel(
      List<AssignedLevel>? levels, String userId) async {
    if (levels == null || levels.isEmpty) {
      
      return;
    }

    var isar = Isar.getInstance(db);
    final collection = isar?.collection<IsarAssignedLevel>();

    await isar?.writeTxn(() async {
      for (AssignedLevel level in levels) {
        final existingLevel = await collection
            ?.where()
            .filter()
            .userIdEqualTo(userId)
            .and()
            .levelKeyEqualTo(level.levelKey)
            .findFirst();

        if (existingLevel == null) {
          final newDistrict = IsarAssignedLevel()
            ..userId = userId
            ..levelKey = level.levelKey
            ..levelName = level.levelName
            ..surveyLevel = level.surveyLevel
            ..assignedLevel = level.assignedLevel
            ..geoJsonLevel = level.geoJsonLevel
            ..geoJsonLevelCount = level.geoJsonLevelCount
            ..assignedLevelId = level.assignedLevelId
            ..surveyLevelCount = level.surveyLevelCount;

          await collection?.put(newDistrict);
        } else {
          existingLevel.levelName = level.levelName;
          existingLevel.assignedLevelId = level.assignedLevelId;
          await collection?.put(existingLevel);
        }
      }
    });
  }

  Future<List<AssignedLevel>?> fetchAssignedLevel(String userId) async {
    var isar = Isar.getInstance(db);
    final collection = isar!.collection<IsarAssignedLevel>();

    final data =
        await collection.where().filter().userIdEqualTo(userId).findAll();

    if (data.isNotEmpty) {
      return data.map((isarDistrict) {
        return AssignedLevel(
          levelKey: isarDistrict.levelKey,
          levelName: isarDistrict.levelName,
          surveyLevel: isarDistrict.surveyLevel,
          assignedLevel: isarDistrict.assignedLevel,
          geoJsonLevel: isarDistrict.geoJsonLevel,
          geoJsonLevelCount: isarDistrict.geoJsonLevelCount,
          assignedLevelId: isarDistrict.assignedLevelId,
          surveyLevelCount: isarDistrict.surveyLevelCount,
        );
      }).toList();
    }
    return null;
  }

  Future<bool> deleteAssignedLevel() async {
    try {
      var isar = Isar.getInstance(db);
      final collection = isar!.collection<IsarAssignedLevel>();
      final data = await collection.where().findAll();

      await isar.writeTxn(() async {
        for (IsarAssignedLevel dta in data) {
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
