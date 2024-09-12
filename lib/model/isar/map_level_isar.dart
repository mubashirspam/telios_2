import 'package:isar/isar.dart';

part 'map_level_isar.g.dart';

@collection
class IsarMapLevelModel {
  Id id = Isar.autoIncrement;
  @Index(type: IndexType.value)
  String? assignedLevelKey;
  String? assignedLevelName;
  List<IsarMapLevel>? levels;

  IsarMapLevelModel({
    this.id = Isar.autoIncrement,
    this.assignedLevelKey,
    this.assignedLevelName,
    this.levels,
  });

  IsarMapLevelModel copyWith({
    Id? id,
    String? assignedLevelKey,
    String? assignedLevelName,
    List<IsarMapLevel>? levels,
  }) {
    return IsarMapLevelModel(
      id: id ?? this.id,
      assignedLevelKey: assignedLevelKey ?? this.assignedLevelKey,
      assignedLevelName: assignedLevelName ?? this.assignedLevelName,
      levels: levels ?? this.levels,
    );
  }
}

@embedded
class IsarMapLevel {
  String? levelName;
  String? levelKey;
  String? geoJson;
  int? surveyLevelCount;

  IsarMapLevel({
    this.levelName,
    this.levelKey,
    this.geoJson,
    this.surveyLevelCount,
  });

  IsarMapLevel copyWith({
    String? levelName,
    String? levelKey,
    String? geoJson,
    int? surveyLevelCount,
  }) {
    return IsarMapLevel(
      levelName: levelName ?? this.levelName,
      levelKey: levelKey ?? this.levelKey,
      geoJson: geoJson ?? this.geoJson,
      surveyLevelCount: surveyLevelCount ?? this.surveyLevelCount,
    );
  }
}
