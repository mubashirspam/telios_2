import 'package:hive/hive.dart';

part 'survey_level_isar.g.dart';

@HiveType(typeId: 8)
class HiveSurveyLevelModel  {
  @HiveField(0)
  String? geoJsonLevelKey;

  @HiveField(1)
  String? geoJsonLevelName;

  @HiveField(2)
  String? assignedLevelKey;

  @HiveField(3)
  String? assignedLevelName;

  @HiveField(4)
  List<HiveSurveyLevel>? levels;
}

@HiveType(typeId: 9)
class HiveSurveyLevel {
  @HiveField(0)
  String? levelName;

  @HiveField(1)
  String? levelKey;

  @HiveField(2)
  String? geoJson;
}
