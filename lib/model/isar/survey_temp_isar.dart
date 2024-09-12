import 'package:isar/isar.dart';
part 'survey_temp_isar.g.dart';

@collection
class IsarSurveyTemp {
  Id id = Isar.autoIncrement;
  @Index(type: IndexType.value)
  String? surveyLevelName;
  String? surveyLevelKey;
  String? assignedLevelKey;
  String? assignedLevelName;
  List<IsarSurveyTempAnswers>? answers;
}

@embedded
class IsarSurveyTempAnswers {
  int? surveyId;
  int? questionId;
  String? question;
  int? typeId;
  String? answer;
  List<String>? answerOptions;
}
