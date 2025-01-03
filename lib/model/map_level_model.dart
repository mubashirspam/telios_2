class MapLevel {
  String? assignedLevelKey;
  String? assignedLevelName;
  String? levelName;
  String? levelKey;
  int? surveyLevelCount;
  String? geoJson;

  MapLevel({
    this.assignedLevelKey,
    this.levelName,
    this.levelKey,
    this.assignedLevelName,
    this.surveyLevelCount,
    this.geoJson,
  });

  MapLevel copyWith({
    String? assignedLevelKey,
    String? levelName,
    String? levelKey,
    String? assignedLevelName,
    int? surveyLevelCount,
    String? geoJson,
  }) =>
      MapLevel(
        assignedLevelKey: assignedLevelKey ?? this.assignedLevelKey,
        levelName: levelName ?? this.levelName,
        levelKey: levelKey ?? this.levelKey,
        assignedLevelName: assignedLevelName ?? this.assignedLevelName,
        surveyLevelCount: surveyLevelCount ?? this.surveyLevelCount,
        geoJson: geoJson ?? this.geoJson,
      );
}
