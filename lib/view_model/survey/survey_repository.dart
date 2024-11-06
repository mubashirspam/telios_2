import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:telios_2/view_model/survey/db/survey_temp_db.dart';
import '../../model/model.dart';
import '../../settings/settings.dart';
import 'db/survey_db.dart';

class SurveyRepository {
  final _db = SurveyDB.instance;
  final _tempDb = SurveyTempDB.instance;
  final Dio _dio = Dio();

  Future<RemoteQuestionModel> fetchSurveyQustionRemote(
      {required String assignedLevelKey, required String token}) async {
    try {
      log('API call => ${ApiEndPoints.surveyQuestions}');

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      // Make the API request.
      final response = await _dio.get(
        ApiEndPoints.surveyQuestions,
        options: Options(headers: headers),
      );
      return RemoteQuestionModel.fromJson(response.data);
    } on DioException catch (e, stackTrace) {
      log('Error occurred while fetching survey question: $e , $stackTrace',
          stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<List<QuestionModel>?> fetchSurveyQustionDB(
    String assignedLevelKey,
  ) async {
    final localResponse = await _db.fetchSurveyQustionDB(assignedLevelKey);
    return Future.value(localResponse);
  }

  Future<void> postSurveyQustionlDB(
      QuestionModel? data, String assignedLevelKey, int sureveyId) async {
    if (data == null) {
      return;
    }

    await _db.postSurveyQuestionDB(data, assignedLevelKey, sureveyId);
  }

  Future<RemoteDropdownOptionsModel> fetchDropdownOptionsRemote(
      {required String levelKey,
      required String token,
      required String surveyId}) async {
    try {
      log('API call => ${ApiEndPoints.dropdownOption}');

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      final data = json.encode({
        "query": [
          {"levelKey": levelKey, "answerOptionVsquestion::surveyId": surveyId},
          {"common": 1, "answerOptionVsquestion::surveyId": surveyId}
        ],
        "limit": 500,
        "offset": 1
      });

      final response = await _dio.post(ApiEndPoints.dropdownOption,
          options: Options(headers: headers), data: data);

      return RemoteDropdownOptionsModel.fromJson(response.data);
    } on DioException catch (e, stackTrace) {
      log('Error occurred while fetching options$e , $stackTrace',
          stackTrace: stackTrace);
      rethrow;
    }
  }

  // Survey Answer Access

  Future<List<MultiDropdownOptionModel>?> fetchDropDownOptionDB({
    String? levelKey,
    int? surveyId,
    int? questionId,
  }) async {
    final localResponse = await _db.fetchDropDownOptionDB(
      levelkey: levelKey,
      surveyId: surveyId,
      questionId: questionId,
    );
    return Future.value(localResponse);
  }

  Future<void> postDropDownOptionDB(MultiDropdownOptionModel? data) async {
    await _db.postDropDownOptionDB(data);
  }

  Future<bool> clearDropDownOptioDB() async {
    return await _db.clearDropDownOptioDB();
  }

  // Survey Answer Access

  Future<List<SurveyAnswerModel>?> fetchSurveyAnswerDB({
    String? assignedLevelKey,
    String? geoJsonLevelKey,
    String? surveyLevelKey,
  }) async {
    final localResponse = await _db.fetchSurveyAnswerDB(
        assignedLevelKey: assignedLevelKey,
        geoJsonLevelKey: geoJsonLevelKey,
        surveyLevelKey: surveyLevelKey);
    return Future.value(localResponse);
  }

  Future<void> postSurveyAnswerDB(SurveyAnswerModel answerData) async {
    await _db.postSurveyAnswerDB(answerData);
  }

  Future<bool> clearSurveyQustionDB() async {
    return await _db.clearSurveyQustionDB();
  }

  Future<bool> clearSurveyAnswerDB() async {
    return await _db.clearSurveyAnswerDB();
  }
  // Survey Temporay Access

  Future<List<SurveyTemp>?> fetchSurveyTempDB() async {
    final localResponse = await _tempDb.fetchSurveyTempDB();
    return Future.value(localResponse);
  }

  Future<void> postSurveyTempDB(SurveyTemp answerData) async {
    await _tempDb.postSurveyTempDB(answerData);
  }

  Future<bool> clearSurveyTempDB() async {
    return await _tempDb.clearSurveyTempDB();
  }

  Future<SyncSurveyAnswerModelRemote> syncSurveyAnswers(
      {required String token, required String unitKey}) async {
    try {
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      var data = json.encode({
        "query": [
          {"unitKey": unitKey, "latestFlag": 1}
        ]
      });

      var response = await _dio.post(ApiEndPoints.syncSurvey,
          options: Options(headers: headers), data: data);

      return SyncSurveyAnswerModelRemote.fromJson(response.data);
    } on DioException catch (e, stackTrace) {
      log(' syncSurvey  $e', stackTrace: stackTrace);
      rethrow;
    }
  }

  // Future<void> syncSurveyAnswerDB(
  //     List<SyncSurveyAnswerModel> answerData, String assignedLevelKey) async {
  //   await _db.syncSurveyAnswerDB(answerData, assignedLevelKey);
  // }

  Future<PostSurveyResponseModel> postSurveyAnswerRemote(
      {required String surveyData,
      required String token,
      required String userId}) async {
    log('API call => ${ApiEndPoints.postSurvey}');
    try {
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };

      final String uploadData = json.encode(surveyData);

      var data = json.encode({
        "query": [
          {"user_id": "==$userId"}
        ],
        "script": "BulkUploadSurveyGeneric",
        "script.param": uploadData
      });

      // log(uploadData);
      log(data);

      final response = await _dio.post(ApiEndPoints.postSurvey,
          options: Options(headers: headers), data: data);

      return PostSurveyResponseModel.fromJson(response.data);
    } on DioException catch (e, stackTrace) {
      log('Error occurred while fetching assigned levels: $e',
          stackTrace: stackTrace);
      rethrow;
    }
  }
}
