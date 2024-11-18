import 'package:hive/hive.dart';

part 'survey_answer_isar.g.dart';

@HiveType(typeId: 5)
class HiveSurveyAnswerModel {
  @HiveField(0)
  String? geoJsonLevelKey;

  @HiveField(1)
  String? geoJsonLevelName;

  @HiveField(2)
  String? surveyLevelName;

  @HiveField(3)
  String? surveyLevelKey;

  @HiveField(4)
  String? assignedLevelKey;

  @HiveField(5)
  String? assignedLevelName;

  @HiveField(6)
  List<HiveAnswer>? answers;

  @HiveField(7)
  int? aCategory;

  @HiveField(8)
  int? sCategory;

  @HiveField(9)
  int? gCategory;
}

@HiveType(typeId: 6)
class HiveAnswer {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? answer;

  @HiveField(2)
  String? type;

  @HiveField(3)
  int? category;

  @HiveField(4)
  int? surveyId;

  @HiveField(5)
  int? questionId;

  @HiveField(6)
  String? question;

  @HiveField(7)
  int? typeId;

  @HiveField(8)
  List<HiveDItem>? answerOptions;
}

@HiveType(typeId: 7)
class HiveDItem {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? name;
}
