import 'package:isar/isar.dart';

part 'dropdown_options_isar.g.dart';

@collection
class IsarMultiDropdownOptionModel {
  Id id = Isar.autoIncrement;
  @Index(type: IndexType.value)
  String? levelkey;
  int? surveyId;
  List<IsarChildOption>? options;
  List<IsarChildOption>? nestedOptions;
}

@embedded
class IsarChildOption {
  int? optionId;
  int? parentQuestionId;
  int? questionId;
  String? optionValue;
}
