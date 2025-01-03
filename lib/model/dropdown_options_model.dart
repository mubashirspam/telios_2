class MultiDropdownOptionModel {
  int? surveyId;
  String? levelkey;
  List<ChildOption>? nestedOptions;
  List<ChildOption>? option;
  MultiDropdownOptionModel({
    this.surveyId,
    this.nestedOptions,
    this.option,
    this.levelkey,
  });
}

class ChildOption {
  int? optionId;
  String? optionValue;
  int? questionId;
  int? parentOptionId;

  ChildOption({
    this.optionId,
    this.optionValue,
    this.questionId,
    this.parentOptionId,
  });
}
