import 'package:hive/hive.dart';

part 'map_level_isar.g.dart';

@HiveType(typeId: 3)
class HiveMapLevelModel {
  @HiveField(0)
  String? assignedLevelKey;

  @HiveField(1)
  String? assignedLevelName;

  @HiveField(2)
  List<HiveMapLevel>? levels;
}

@HiveType(typeId: 4)
class HiveMapLevel {
  @HiveField(0)
  String? levelName;

  @HiveField(1)
  String? levelKey;

  @HiveField(2)
  String? geoJson;

  @HiveField(3)
  int? surveyLevelCount;
}
