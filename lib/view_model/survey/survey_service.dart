import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:telios_2/model/model.dart';
import '../../settings/settings.dart';
import '../auth/auth_service.dart';
import 'survey.dart';

class SurveyService extends GetxService {
  final _repository = SurveyRepository();
  final _authService = Get.find<AuthService>();

  String get currentToken => _authService.currentToken.value;

  Future<Either<MainFailure, List<QuestionModel>>> fetchSurveyQustions({
    required bool isRemote,
    required String assignedLevelKey,
  }) async {
    if (isRemote) {
      await _authService.refreshTokenIfNeeded();
      return executeWithTokenRefresh(
        () => _repository
            .fetchSurveyQustionRemote(
                token: currentToken, assignedLevelKey: assignedLevelKey)
            .then(
              (result) => result.fold(
                (failure) {
                  Get.snackbar('Error', failure.message);
                  return Left(failure);
                },
                (success) async {
                  log(success.response!.data!.length.toString());
                  final localData = convertSurveyQuestionRemoteToLocal(
                    assignedLevelKey: assignedLevelKey,
                    remoteData: success.response!.data!,
                  );

                  for (var element in localData) {
                    await _repository.postSurveyQustionlDB(
                      element.questions,
                      assignedLevelKey,
                      element.surveyId,
                    );
                  }

                  return Right(localData);
                },
              ),
            ),
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

  Future<Either<MainFailure, SurveyTemp>> postSurveyAnswerRemote(
      String surveyData) async {
    await _authService.refreshTokenIfNeeded();
    return executeWithTokenRefresh(
      () => _repository.postSurveyAnswerRemote(currentToken, surveyData).then(
            (result) => result.fold(
              (failure) {
                Get.snackbar('Error', failure.message);
                return Left(failure);
              },
              (success) async {
                return Right(success);
              },
            ),
          ),
    );
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

  Future<void> postSurveyAnswerDB(SurveyAnswerModel answerData) async {
    await _repository.postSurveyAnswerDB(answerData);
  }

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
