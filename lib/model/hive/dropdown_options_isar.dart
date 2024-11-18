import 'package:hive/hive.dart';

part 'dropdown_options_isar.g.dart';

@HiveType(typeId: 1)
class HiveMultiDropdownOptionModel {
  @HiveField(0)
  String? levelKey;

  @HiveField(1)
  int? surveyId;

  @HiveField(2)
  List<HiveChildOption>? options;

  @HiveField(3)
  List<HiveChildOption>? nestedOptions;
}

@HiveType(typeId: 2)
class HiveChildOption {
  @HiveField(0)
  int? optionId;

  @HiveField(1)
  int? parentQuestionId;

  @HiveField(2)
  int? questionId;

  @HiveField(3)
  String? optionValue;
}
