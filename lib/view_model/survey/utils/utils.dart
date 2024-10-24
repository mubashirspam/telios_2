import 'package:telios_2/model/model.dart';

PostSurvey convertTempAnswerToPostRemoteAnswer(List<SurveyTemp> surveyTemp) {
  return PostSurvey(
    survey: surveyTemp.map((temp) {
      // Group answers by surveyId
      Map<String, List<SurveyTempAnswers>> groupedAnswers = {};

      temp.answers?.forEach((answer) {
        final surveyId = answer.surveyId?.toString();
        if (surveyId != null) {
          groupedAnswers.putIfAbsent(surveyId, () => []).add(answer);
        }
      });

      // Convert grouped answers to SurveyAnswer
      List<SurveyAnswer> surveyAnswers = groupedAnswers.entries.map((entry) {
        return SurveyAnswer(
          surveyId: entry.key,
          answers: entry.value.map((answer) {
            return AnswerClass(
              questionId: answer.questionId,
              question: answer.question,
              typeId: answer.typeId,
              answer: answer.answer,
              answerOptions: answer.answerOptions?.map((opt) {
                return Option(optionId: opt.id, optionValue: opt.name);
              }).toList(),
            );
          }).toList(),
        );
      }).toList();

      return Survey(
        surveyLevelName: temp.surveyLevelName,
        surveyLevelKey: temp.surveyLevelKey,
        assignedLevelKey: temp.assignedLevelKey,
        assignedLevelName: temp.assignedLevelName,
        geoJsonLevelKey: temp.geoJsonLevelKey,
        geoJsonLevelName: temp.geoJsonLevelName,
        surveyAnswers: surveyAnswers,
      );
    }).toList(),
  );
}

List<MultiDropdownOptionModel> convertDropdownOptionRemoteToLocal(
    RemoteDropdownOptionsModel remoteData, String levelKey) {
  // Create a map to group MultiDropdownOptionModel by surveyId
  Map<int, MultiDropdownOptionModel> groupedBySurveyId = {};

  // Check if response data exists
  if (remoteData.response?.data != null &&
      remoteData.response!.data!.isNotEmpty) {
    for (var element in remoteData.response!.data!) {
      // Check if fieldData exists
      if (element.fieldData != null) {
        int? surveyId = element.fieldData!.answerOptionVsquestionSurveyId;
        if (surveyId == null) continue;

        // Create ChildOption for fieldData
        ChildOption fieldChildOption = ChildOption(
          optionId: element.fieldData!.id,
          optionValue: element.fieldData!.optionValue,
          questionId: element.fieldData!.questionId,
        );

        // Create a list of ChildOptions for answerOptionsVsself
        List<ChildOption> nestedOptionList = [];
        if (element.portalData?.answerOptionsVsself != null &&
            element.portalData!.answerOptionsVsself!.isNotEmpty) {
          for (var nestedOption in element.portalData!.answerOptionsVsself!) {
            // Add nested options with parent questionId
            nestedOptionList.add(ChildOption(
              optionId: nestedOption.answerOptionsVsselfId,
              optionValue: nestedOption.answerOptionsVsselfOptionValue,
              questionId: nestedOption.answerOptionsVsselfQuestionId,
              parentOptionId:
                  _parseInt(nestedOption.answerOptionsVsselfParentOptionId),
            ));
          }
        }

        // Check if MultiDropdownOptionModel for this surveyId exists
        if (groupedBySurveyId.containsKey(surveyId)) {
          // If exists, add the new options and nested options to the existing model
          groupedBySurveyId[surveyId]!.option!.add(fieldChildOption);
          groupedBySurveyId[surveyId]!.nestedOptions!.addAll(nestedOptionList);
        } else {
          // Create a new MultiDropdownOptionModel for this surveyId
          MultiDropdownOptionModel newMultiDropdownOption =
              MultiDropdownOptionModel(
            surveyId: surveyId,
            levelkey: levelKey,
            option: [fieldChildOption], // Add fieldChildOption to option list
            nestedOptions: nestedOptionList, // Add nested options
          );
          // Add the new model to the map
          groupedBySurveyId[surveyId] = newMultiDropdownOption;
        }
      }
    }
  }

  // Convert the map values to a list of MultiDropdownOptionModel
  return groupedBySurveyId.values.toList();
}

List<QuestionModel> convertSurveyQuestionRemoteToLocal({
  required String assignedLevelKey,
  required List<QuestionDatum> remoteData,
}) {
  List<QuestionModel> result = [];

  result = remoteData.map((e) {
    final surveyId = e.fieldData?.id ?? 0;
    final surveyName = e.fieldData?.survey ?? '';
    return QuestionModel(
      surveyId: surveyId,
      surveyName: surveyName,
      surveyCategories: e.portalData?.surveyVssurveyQuestionsVscategoryX
              ?.map((e) {
            return SurveyCategory(
              categoryName: e.surveyVssurveyQuestionsVscategoryXCategoryName,
              categoryColor: _parseColor(
                  e.surveyVssurveyQuestionsVscategoryXCategoryColor),
              questionId:
                  _parseInt(e.surveyVssurveyQuestionsVscategoryXQuestionId),
              surveyId: _parseInt(e.surveyVssurveyQuestionsVscategoryXSurveyId),
            );
          }).toList() ??
          [],
      questions: e.portalData?.surveyQuestion?.map((ee) {
            return Question(
              surveyId: surveyId,
              surveyName: surveyName,
              questionId: ee.surveyQuestionId ?? 0,
              typeId: ee.surveyQuestionQuestionTypeId ?? 0,
              question: ee.surveyQuestionQuestion ?? '',
              type: ee.surveyQuestionQuestionTypeId?.toString() ?? '',
              colorcode: _parseColor(
                  ee.surveyVssurveyQuestionsVscategoryCategoryColor),
              isquestionVisble:
                  ee.surveyQuestionIsCounter?.toLowerCase() == '0',
              hint: ee.surveyQuestionHint,
              isCounter: ee.surveyQuestionIsCounter?.toLowerCase() == '1',
              parentQuestionId: ee.surveyQuestionParentId,
            );
          }).toList() ??
          [],
    );
  }).toList();

  return result;
}

List<SurveyAnswerModel> convertSyncSurveyAnswerToLocal(
    SyncSurveyAnswerModelRemote remoteData) {
  List<SurveyAnswerModel> newSurvey = [];

  newSurvey = remoteData.response?.data
          ?.map(
            (v) {
              String? data = v.fieldData?.responseJson;
              if (data != null) {
                Survey survey = surveyFromJson(data);

                return SurveyAnswerModel(
                  assignedLevelKey: survey.assignedLevelKey,
                  assignedLevelName: survey.assignedLevelName,
                  geoJsonLevelKey: survey.geoJsonLevelKey,
                  geoJsonLevelName: survey.geoJsonLevelName,
                  surveyLevelName: survey.surveyLevelName,
                  surveyLevelKey: survey.surveyLevelKey,
                  answers: survey.surveyAnswers
                      ?.expand((e) {
                        final List<AnswerClass>? a = e.answers;
                        return a?.map((answer) {
                              return Answer(
                                surveyId: _parseInt(e.surveyId),
                                questionId: answer.questionId,
                                question: answer.question,
                                typeId: answer.typeId,
                                answer: answer.answer,
                                answerOptions:
                                    answer.answerOptions?.map((option) {
                                  return DItem(
                                    option.optionValue ?? '',
                                    option.optionId ?? 0,
                                  );
                                }).toList(),
                              );
                            }) ??
                            <Answer>[];
                      })
                      .toList()
                      .cast<Answer>(), // Explicitly cast to List<Answer>
                );
              }
              return null;
            },
          )
          .where((element) => element != null)
          .cast<SurveyAnswerModel>()
          .toList() ??
      [];

  return newSurvey;
}

int? _parseColor(String? colorString) {
  if (colorString == null) return null;
  try {
    return int.parse(colorString);
  } catch (e) {
    return null;
  }
}

bool? _parseBool(String? boolString) {
  if (boolString == null) return null;
  return boolString.toLowerCase() == 'true';
}

int? _parseInt(String? intString) {
  if (intString == null) return null;
  try {
    return int.parse(intString);
  } catch (e) {
    return null;
  }
}
