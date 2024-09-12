import '../helper/constants.dart';

class ApiEndPoints {
  static final initializeToken = '$baseUrl/$version/sessions';
  static final login = '$baseUrl/$version/layouts/Telios_user/_find';
  static final mapLevel = '$baseUrl/$version/layouts/geoJsonLevel/_find';
  static final language = '$baseUrl/$version/layouts/Telios_Language/_find';
  static final fetchUser = '$baseUrl/$version/layouts/person/_find';
  static final assignedLevel = '$baseUrl/$version/layouts/LevelAssigned/_find';

  static final surveyQuestions =
      '$baseUrl/$version/layouts/surveyQuestions/records';

  static final postSurvey =
      '$baseUrl/$version/layouts/Telios_user_bulk_upload/records/416';
}
