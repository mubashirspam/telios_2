import 'package:isar/isar.dart';
part 'survey_level_isar.g.dart';

@collection
class IsarSurveyLevelModel {
  Id id = Isar.autoIncrement;
  @Index(type: IndexType.value)
  String? geoJsonLevelKey;
  String? geoJsonLevelName;
  String? assignedLevelKey;
  String? assignedLevelName;
  List<IsarSureveyLevel>? levels;
}

@embedded
class IsarSureveyLevel {
  String? levelName;
  String? levelKey;
  String? geoJson;
}
