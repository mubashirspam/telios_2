import 'package:get/get.dart';

class QuestionModel {
  final int surveyId;
  final String surveyName;
  final List<Question> questions;

  QuestionModel({
    required this.surveyId,
    required this.surveyName,
    required this.questions,
  });
}

class Question {
  final int questionId;
  final String question;
  final String type;
  final int typeId;
  final int surveyId;
  final String surveyName;
  final List<String>? options;
  final Map<String, List<String>>? nestedOptions;
  final RxString answer = RxString('');
  final RxString nestedAnswer = RxString('');
  final RxList<String> multiAnswer = RxList<String>([]);
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
  });
}
