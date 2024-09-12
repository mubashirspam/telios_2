import 'package:isar/isar.dart';
part 'survey_answer_isar.g.dart';

@collection
class IsarSurveyAnswerModel {
  Id id = Isar.autoIncrement;
  @Index(type: IndexType.value)
  String? geoJsonLevelKey;
  String? geoJsonLevelName;
  String? surveyLevelName;
  String? surveyLevelKey;
  String? assignedLevelKey;
  String? assignedLevelName;
  List<IsarAnswer>? answers;
  String? aCategory;
  String? sCategory;
  String? gCategory;
}

@embedded
class IsarAnswer {
  String? id;
  String? answer;
  String? type;
  String? category;
  int? surveyId;
  int? questionId;
  String? question;
  int? typeId;
  List<String>? answerOptions;
}
