import 'package:hive/hive.dart';
part 'survey_temp_isar.g.dart';

@HiveType(typeId: 13)
class HiveSurveyTemp  {
  @HiveField(0)
  String? surveyLevelName;

  @HiveField(1)
  String? surveyLevelKey;

  @HiveField(2)
  String? assignedLevelKey;

  @HiveField(3)
  String? assignedLevelName;

  @HiveField(4)
  String? geoJsonLevelKey;

  @HiveField(5)
  String? geoJsonLevelName;

  @HiveField(6)
  List<HiveSurveyTempAnswers>? answers;
}

@HiveType(typeId: 14)
class HiveSurveyTempAnswers {
  @HiveField(0)
  int? surveyId;

  @HiveField(1)
  int? questionId;

  @HiveField(2)
  String? question;

  @HiveField(3)
  int? typeId;

  @HiveField(4)
  String? answer;

  @HiveField(5)
  List<HiveDItemTemp>? answerOptions;
}

@HiveType(typeId: 15)
class HiveDItemTemp {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? name;
}
