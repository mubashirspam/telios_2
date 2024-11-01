import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:telios_2/model/model.dart';
import '../../settings/settings.dart';
import '../auth/auth_service.dart';
import 'survey.dart';

class SurveyService extends GetxService {
  final _repository = SurveyRepository();
  final _authService = Get.find<AuthService>();

  String get currentToken => _authService.currentToken.value;
  String get userId => _authService.userId.value;

  Future<Either<MainFailure, List<QuestionModel>>> fetchSurveyQustions({
    required bool isRemote,
    required String assignedLevelKey,
  }) async {
    if (isRemote) {
      await _authService.refreshTokenIfNeeded();
      final response = await executeWithTokenRefresh(() =>
          _repository.fetchSurveyQustionRemote(
              token: currentToken, assignedLevelKey: assignedLevelKey));

      return response.fold(
        (failure) => Left(failure),
        (success) async {
          try {
            final localData = convertSurveyQuestionRemoteToLocal(
              assignedLevelKey: assignedLevelKey,
              remoteData: success.response!.data!,
            );
            for (var element in localData) {
              await _repository.postSurveyQustionlDB(
                element,
                assignedLevelKey,
                element.surveyId,
              );
            }
            return Right(localData);
          } catch (e) {
            return Left(
                MainFailure(message: 'Error processing data: ${e.toString()}'));
          }
        },
      );
    } else {
      try {
        final localData =
            await _repository.fetchSurveyQustionDB(assignedLevelKey);
        if (localData != null) {
          return Right(localData);
        } else {
          return Left(MainFailure(message: 'User not found in local database'));
        }
      } catch (e) {
        return Left(MainFailure(
            message:
                'Error fetching user from local database: ${e.toString()}'));
      }
    }
  }

  Future<Either<MainFailure, PostSurveyResponseModel>> postSurveyAnswerRemote(
      String surveyData) async {
    try {
      await _authService.refreshTokenIfNeeded();
      return executeWithTokenRefresh(() => _repository.postSurveyAnswerRemote(
          token: currentToken, surveyData: surveyData, userId: userId));
    } on DioException catch (e) {
      showSnackbar('Error on uploading survey', e.toString());
      return Left(MainFailure(message: e.toString()));
    }
  }

  

  Future<Either<MainFailure, List<SurveyAnswerModel>>> syncSurveyAnswers(
    String unitKey,
  ) async {
    await _authService.refreshTokenIfNeeded();
    final response = await executeWithTokenRefresh(
      () =>
          _repository.syncSurveyAnswers(token: currentToken, unitKey: unitKey),
    );

    return response.fold((failure) => Left(failure), (success)  {
      final answerData = convertSyncSurveyAnswerToLocal(success);

     
      return Right(answerData);
    });
  }

  Future<Either<MainFailure, List<SurveyAnswerModel>>> fetchSurveyAnswerDB({
    String? assignedLevelKey,
    String? geoJsonLevelKey,
    String? surveyLevelKey,
  }) async {
    final localResponse = await _repository.fetchSurveyAnswerDB(
      assignedLevelKey: assignedLevelKey,
      geoJsonLevelKey: geoJsonLevelKey,
      surveyLevelKey: surveyLevelKey,
    );

    if (localResponse != null && localResponse.isNotEmpty) {
      return Right(localResponse);
    }
    return Left(MainFailure(message: 'No data found'));
  }

  Future<Either<MainFailure, List<MultiDropdownOptionModel>>>
      fetchDropdownOptions(
          {required bool isRemote,
          required String levelKey,
          required int? surveyId}) async {
    if (isRemote) {
      await _authService.refreshTokenIfNeeded();

      final response = await executeWithTokenRefresh(() =>
          _repository.fetchDropdownOptionsRemote(
              token: currentToken,
              levelKey: levelKey,
              surveyId: surveyId.toString()));

      return response.fold(
        (failure) => Left(failure),
        (success) async {
          try {
            final localData =
                convertDropdownOptionRemoteToLocal(success, levelKey);
            for (var element in localData) {
              await _repository.postDropDownOptionDB(element);
            }
            return Right(localData);
          } catch (e) {
            return Left(
                MainFailure(message: 'Error processing data: ${e.toString()}'));
          }
        },
      );
    } else {
      try {
        final localData = await _repository.fetchDropDownOptionDB(
          levelKey: levelKey,
          surveyId: surveyId,
        );
        if (localData != null) {
          log("right");
          return Right(localData);
        } else {
          return Left(MainFailure(message: 'User not found in local database'));
        }
      } catch (e) {
        return Left(MainFailure(
            message:
                'Error fetching user from local database: ${e.toString()}'));
      }
    }
  }

  Future<void> postSurveyAnswerDB(SurveyAnswerModel answerData) async {
    await _repository.postSurveyAnswerDB(answerData);
  }

  //   Future<void> syncSurveyAnswerDB(List<SyncSurveyAnswerModel> answerData, String assignedLevelKey) async {
  //   await _repository.syncSurveyAnswerDB(answerData,assignedLevelKey);
  // }

  Future<Either<MainFailure, List<SurveyTemp>>> fetchSurveyTempDB() async {
    final localResponse = await _repository.fetchSurveyTempDB();

    if (localResponse != null && localResponse.isNotEmpty) {
      return Right(localResponse);
    }
    return Left(MainFailure(message: 'No data found'));
  }

  Future<void> postSurveyTempDB(SurveyTemp answerData) async {
    await _repository.postSurveyTempDB(answerData);
  }

  Future<bool> clearSurveyTempDB() async {
    return await _repository.clearSurveyTempDB();
  }
}
