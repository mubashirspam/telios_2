import 'package:isar/isar.dart';

part 'assigned_level_isar.g.dart';

@collection
class IsarAssignedLevel {
  Id id = Isar.autoIncrement;
  @Index(type: IndexType.value)
  String? userId;
  String? unitId;
  String? levelName;
  String? levelKey;
  String? assignedLevel;
  String? surveyLevel;
  int? surveyLevelCount;
  String? geoJsonLevel;
  int? geoJsonLevelCount;
  String? geoJson;
  int? assignedLevelId;
}
