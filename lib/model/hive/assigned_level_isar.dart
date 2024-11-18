import 'package:hive/hive.dart';

part 'assigned_level_isar.g.dart';

@HiveType(typeId: 0) // Assign a unique typeId
class HiveAssignedLevel {
  @HiveField(0)
  String? userId;

  @HiveField(1)
  String? unitId;

  @HiveField(2)
  String? levelName;

  @HiveField(3)
  String? levelKey;

  @HiveField(4)
  String? assignedLevel;

  @HiveField(5)
  String? surveyLevel;

  @HiveField(6)
  int? surveyLevelCount;

  @HiveField(7)
  String? geoJsonLevel;

  @HiveField(8)
  int? geoJsonLevelCount;

  @HiveField(9)
  String? geoJson;

  @HiveField(10)
  int? assignedLevelId;
}
