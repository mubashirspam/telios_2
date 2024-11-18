import 'package:get/get.dart';

class QuestionModel {
  final int surveyId;
  final String surveyName;
  List<Question> questions;
  final List<SurveyCategory> surveyCategories;

  QuestionModel({
    required this.surveyId,
    required this.surveyName,
    required this.questions,
    required this.surveyCategories,
  });
}

class Question {
  final int questionId;
  final String question;
  final String type;
  final int typeId;
  final int surveyId;
  final String surveyName;
  final String? parentQuestionId;
  List<DItem>? options;
  Map<int, List<DItem>>? nestedOptions;
  RxString answer = RxString('');
  final RxString nestedAnswer = RxString('');
  final RxList<DItem> multiAnswer = RxList<DItem>([]);
  final RxList<DItem> multiAnswernestedAnswer = RxList<DItem>([]);
  final int? colorcode;
  final bool? isquestionVisble;
  final String? hint;
  final bool? isCounter;

  Question({
    required this.questionId,
    required this.surveyName,
    required this.question,
    required this.type,
    this.options,
    this.nestedOptions,
    this.colorcode,
    this.isquestionVisble,
    this.hint,
    required this.isCounter,
    required this.surveyId,
    required this.typeId,
    this.parentQuestionId,
  });
}

class SurveyCategory {
  final int? questionId;
  final int? surveyId;
  final String? categoryName;
  final int? categoryColor;

  SurveyCategory({
    this.questionId,
    this.categoryColor,
    this.surveyId,
    this.categoryName,
  });
}

class DItem {
  String name;
  int id;
  DItem(this.name, this.id);
}
