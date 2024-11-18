import 'package:hive/hive.dart';
part 'survey_question_isar.g.dart';

@HiveType(typeId: 10)
class HiveSurveyQuestionModel  {
  @HiveField(0)
  String? assignedLevelKey;

  @HiveField(1)
  int? surveyId;

  @HiveField(2)
  String? surveyName;

  @HiveField(3)
  List<HiveSurveyQuestion>? questions;

  @HiveField(4)
  List<HiveSurveyCategory>? category;
}

@HiveType(typeId: 11)
class HiveSurveyQuestion {
  @HiveField(0)
  int? questionId;

  @HiveField(1)
  String? question;

  @HiveField(2)
  String? type;

  @HiveField(3)
  int? typeId;

  @HiveField(4)
  int? colorcode;

  @HiveField(5)
  bool? isQuestionVisible;

  @HiveField(6)
  String? hint;

  @HiveField(7)
  bool? isCounter;

  @HiveField(8)
  String? parentQuestionId;
}

@HiveType(typeId: 12)
class HiveSurveyCategory {
  @HiveField(0)
  int? questionId;

  @HiveField(1)
  int? surveyId;

  @HiveField(2)
  String? categoryName;

  @HiveField(3)
  int? colorcode;
}
