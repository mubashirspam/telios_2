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

  Future<Either<MainFailure, RemoteQuestionModel>> fetchSurveyQustionRemote({
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
        return Right(RemoteQuestionModel.fromJson(response.data));
      } else {
        return Left(AppException.failures(response.data));
      }
    } on DioException catch (e) {
      return Left(AppException.failures(e));
    } catch (e, stackTrace) {
      log('Error occurred while fetching assigned levels: $e',
          stackTrace: stackTrace);
      return Left(MainFailure(message: e.toString()));
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

  Future<Either<MainFailure, RemoteDropdownOptionsModel>>
      fetchDropdownOptionsRemote({
    required String levelKey,
    required String token,
    required String surveyId,
  }) async {
    try {
      log('API call => ${ApiEndPoints.dropdownOption}');

      // Set headers and data for the API request.
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      var data = json.encode({
        "query": [
          {"levelKey": levelKey, "answerOptionVsquestion::surveyId": surveyId}
        ]
      });

      final response = await Dio().request(
        ApiEndPoints.dropdownOption,
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      // Check the status code and return the appropriate response.
      if (response.statusCode == 200) {
        return Right(RemoteDropdownOptionsModel.fromJson(response.data));
      } else {
        return Left(AppException.failures(response.data));
      }
    } on DioException catch (e) {
      // log(e.toString());
      return Left(AppException.failures(e));
    } catch (e, stackTrace) {
      // log('Error occurred while fetching assigned levels: $e',
      //     stackTrace: stackTrace);
      return Left(MainFailure(message: e.toString()));
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

  Future<Either<MainFailure, SyncSurveyAnswerModelRemote>> syncSurveyAnswers({
    required String token,
    required String unitKey,
  }) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': token
      };
      var data = json.encode({
        "query": [
          {"levelKey": "IND-AP-504", "answerOptionVsquestion::surveyId": "1"}
        ]
      });
      var dio = Dio();
      var response = await dio.request(
        'https://techgeneza.in/fmi/data/vLatest/databases/DataV1/layouts/answerOptions/_find',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );
    

      if (response.statusCode == 200) {
        print(json.encode(response.data));
      } else {
        print(response.statusMessage);
      }
      return Right(SyncSurveyAnswerModelRemote());

      // log('API call => ${ApiEndPoints.syncSurvey}');

      // final headers = {
      //   'Content-Type': 'application/json',
      //   'Authorization': 'Bearer $token',
      // };

      // var data = json.encode({
      //   "query": [
      //     {"unitKey": 'IND-AP-504', "latestFlag": 1}
      //   ]
      // });

      // final response = await Dio().request(ApiEndPoints.syncSurvey,
      //     options: Options(method: 'POST', headers: headers), data: data);
      // if (response.statusCode == 200) {
      //   log(response.data);
      //   return Right(SyncSurveyAnswerModelRemote());
      // } else {
      //   return Left(AppException.failures(response.data));
      // }
    } on DioException catch (e) {
      log(' syncSurvey  $e');
      return Left(AppException.failures(e));
    } catch (e, stackTrace) {
      log(' syncSurvey  $e', stackTrace: stackTrace);
      return Left(MainFailure(message: e.toString()));
    }
  }

  // Future<void> syncSurveyAnswerDB(
  //     List<SyncSurveyAnswerModel> answerData, String assignedLevelKey) async {
  //   await _db.syncSurveyAnswerDB(answerData, assignedLevelKey);
  // }

  Future<Either<MainFailure, PostSurveyResponseModel>> postSurveyAnswerRemote(
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

      log(uploadData);

      var response = await Dio().request(
        ApiEndPoints.postSurvey,
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        return Right(PostSurveyResponseModel.fromJson(response.data));
      } else {
        return Left(AppException.failures(response.data));
      }
    } on DioException catch (e) {
      // log(e.toString());
      return Left(AppException.failures(e));
    } catch (e, stackTrace) {
      // log('Error occurred while fetching assigned levels: $e',
      //     stackTrace: stackTrace);
      return Left(MainFailure(message: e.toString()));
    }
  }
}
