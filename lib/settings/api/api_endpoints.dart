import '../helper/constants.dart';

class ApiEndPoints {
  static final v = '$baseUrl/$version/layouts';

  static final initializeToken = '$baseUrl/$version/sessions';

  static final login = '$v/Telios_user/_find';

  static final mapLevel = '$v/geoJsonLevel/_find';

  static final language = '$v/Telios_Language/_find';

  static final fetchUser = '$v/person/_find';

  static final assignedLevel = '$v/LevelAssigned/_find';

  static final dropdownOption = '$v/answerOptions/_find';

  static final surveyQuestions = '$v/surveyQuestions/records';

  static final postSurvey = '$v/TeliosUserBulkUploadGeneric/_find';

  static final syncSurvey = '$v/responseAndAnswersFetch/_find';
}
