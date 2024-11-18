

class AssignedLevel {
   String? userId;
   String? unitId;
  String? levelName;
  String? levelKey;
  String? assignedLevel;
  String? surveyLevel;
  int? surveyLevelCount;
  String? geoJsonLevel;
  int? geoJsonLevelCount;
  int ? assignedLevelId;


  AssignedLevel({
    this.userId,
    this.levelName,
    this.levelKey,
    this.surveyLevel,
    this.surveyLevelCount,
    this.assignedLevel,
    this.geoJsonLevel,
    this.geoJsonLevelCount,
    this.assignedLevelId,
    this.unitId,
  });

  AssignedLevel copyWith({
    String? userId,
    String? levelName,
    String? levelKey,
    String? assignedLevel,
    String? surveyLevel,
    int? surveyLevelCount,
    String? geoJsonLevel,
    int? geoJsonLevelCount,
    int? assignedLevelId,
    String? unitId,
  }) =>
      AssignedLevel(
        userId: userId ?? this.userId,
        levelName: levelName ?? this.levelName,
        levelKey: levelKey ?? this.levelKey,
        assignedLevel: assignedLevel ?? this.assignedLevel,
        surveyLevel: surveyLevel ?? this.surveyLevel,
        surveyLevelCount: surveyLevelCount ?? this.surveyLevelCount,
        geoJsonLevel: geoJsonLevel ?? this.geoJsonLevel,
        geoJsonLevelCount: geoJsonLevelCount ?? this.geoJsonLevelCount,
        assignedLevelId: assignedLevelId ?? this.assignedLevelId,
        unitId: unitId ?? this.unitId,
      );
}
