import 'package:telios_2/model/model.dart';

List<QuestionModel> convertSurveyQuestionRemoteToLocal({
  required String assignedLevelKey,
  required List<SurveyQuestionData> remoteData,
}) {
  List<QuestionModel> result = [];

  result = remoteData.map((e) {
    final surveyId = e.fieldData?.id ?? 0;
    final surveyName = e.fieldData?.survey ?? '';
    return QuestionModel(
      surveyId: surveyId,
      surveyName: surveyName,
      questions: e.portalData?.surveyQuestion?.map((ee) {
            return Question(
              surveyId: surveyId,
              surveyName: surveyName,
              questionId: ee.surveyQuestionId ?? 0,
              typeId: ee.surveyQuestionQuestionTypeId ?? 0,
              question: ee.surveyQuestionQuestion ?? '',
              type: ee.surveyQuestionQuestionTypeId?.toString() ?? '',
              colorcode: _parseColor(ee.surveyQuestionColor),
              isquestionVisble:
                  ee.surveyQuestionIsCounter?.toLowerCase() == '0',
              hint: ee.surveyQuestionHint,
              isCounter: ee.surveyQuestionIsCounter?.toLowerCase() == '1',
            );
          }).toList() ??
          [],
    );
  }).toList();

  return result;
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
