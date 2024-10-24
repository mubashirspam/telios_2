import 'package:isar/isar.dart';
part 'survey_question_isar.g.dart';

@collection
class IsarSurveyQusetionModel {
  Id id = Isar.autoIncrement;
  @Index(type: IndexType.value)
  String? assignedLevelKey;
  int? sureveyId;
  String? surveyName;
  List<IsarSurveyQusetion>? questions;
  List<IsarSurveyCategory>? category;
}

@embedded
class IsarSurveyQusetion {
  int? questionId;
  String? question;
  String? type;
  int? typeId;
  int? colorcode;
  bool? isquestionVisble;
  String? hint;
  bool? isCounter;
  String? parentQuestionId;
}
@embedded
class IsarSurveyCategory {
   int? questionId;
   int?surveyId;
   String? categoryName;
   int? colorcode;


}
