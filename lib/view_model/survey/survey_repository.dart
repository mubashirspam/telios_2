import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:telios_2/view_model/survey/db/survey_temp_db.dart';
import '../../model/model.dart';
import '../../settings/settings.dart';
import 'db/survey_db.dart';

class SurveyRepository {
  final _db = SurveyDB.instance;
  final _tempDb = SurveyTempDB.instance;

  Future<Either<MainFailure, SurveyRemoteQuestionModel>>
      fetchSurveyQustionRemote({
    required String assignedLevelKey,
    required String token,
  }) async {
    try {
      log('API call => ${ApiEndPoints.surveyQuestions}');

      // Set headers and data for the API request.
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      // Make the API request.
      var response = await Dio().request(
        ApiEndPoints.surveyQuestions,
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );

      // Check the status code and return the appropriate response.
      if (response.statusCode == 200) {
        return Right(SurveyRemoteQuestionModel.fromJson(response.data));
      } else {
        return Left(AppException.failures(response.data));
      }
    } on DioException catch (e) {
      log(e.toString());
      return Left(AppException.failures(e));
    } catch (e, stackTrace) {
      log('Error occurred while fetching assigned levels: $e',
          stackTrace: stackTrace);
      return Left(MainFailure(message: e.toString()));
    }
  }

  Future<List<QuestionModel>?> fetchSurveyQustionDB(
      String assignedLevelKey,) async {
    final localResponse =
        await _db.fetchSurveyQustionDB(assignedLevelKey);
    return Future.value(localResponse);
  }

  Future<void> postSurveyQustionlDB(
      List<Question>? data, String assignedLevelKey, int sureveyId) async {
    if (data == null) {
      log('Data is null');
      return;
    }

    await _db.postSurveyQuestionDB(data, assignedLevelKey, sureveyId);
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

  Future<Either<MainFailure, SurveyTemp>> postSurveyAnswerRemote(
      String surveyData, String token) async {
    try {
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };

      var data = json.encode({
        "fieldData": {"bulk_upload": "=416"},
        "script": "Bulk_upload_survey",
        "script.param": json.decode(surveyData)
      });

      var response = await Dio().request(
        ApiEndPoints.postSurvey,
        options: Options(
          method: 'PATCH',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        return Right(SurveyTemp());
      } else {
        return Left(AppException.failures(response.data));
      }
    } on DioException catch (e) {
      log(e.toString());
      return Left(AppException.failures(e));
    } catch (e, stackTrace) {
      log('Error occurred while fetching assigned levels: $e',
          stackTrace: stackTrace);
      return Left(MainFailure(message: e.toString()));
    }
  }
}
