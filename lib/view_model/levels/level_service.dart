import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:telios_2/view_model/view_model.dart';
import '../../model/model.dart';
import '../../settings/api/api_exceptions.dart';
import '../../settings/helper/dialogues.dart';
import '../../settings/helper/refresh_token.dart';
import 'package:telios_2/view_model/levels/utils/utils.dart';

class LevelService extends GetxService {
  final _repository = LevelRepository();
  final _authService = Get.find<AuthService>();
  Rxn<Level> level = Rxn();

  String get userId => _authService.userId.value;
  String get currentToken => _authService.currentToken.value;

  Future<Either<MainFailure, List<AssignedLevel>>> fetchAssignedLevel({
    required bool isRemote,
  }) async {
    if (isRemote) {
      await _authService.refreshTokenIfNeeded();
      final response = await executeWithTokenRefresh(
        () => _repository.fetchAssignedLevelRemote(
          userId: userId,
          token: currentToken,
        ),
      );

      return response.fold(
        (failure) => Left(failure),
        (success) async {
          try {
            final localData = convertAssignedRemoteToLocal(
                userId: userId,
                remoteData:
                    success.response!.data!.first.portalData!.dataObject!);

            await _repository.postAssignedLevelDB(localData, userId);
            return Right(localData);
          } catch (e) {
            return Left(
                MainFailure(message: 'Error processing data: ${e.toString()}'));
          }
        },
      );
    } else {
      try {
        final localData = await _repository.fetchAssignedLevelDB(userId);
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

  Future<Either<MainFailure, List<MapLevel>>> fetchMapLevel({
    required bool isRemote,
    required String levelId,
    required String unitId,
    required int id,
  }) async {
    if (isRemote) {
      try {
        await _authService.refreshTokenIfNeeded();
        final response = await executeWithTokenRefresh(() =>
            _repository.fetchMapLevelRemote(
                unitId: unitId, token: currentToken, userId: userId));

        return response.fold(
          (failure) => Left(failure),
          (success) async {
            try {
              final localData =
                  convertMapLevelRemoteToLocal(remoteData: success,assignedLevelId: levelId);
              await _repository.postMapLevelDB(localData, levelId);

              for (MapLevel level in localData) {
                if (level.geoJson != null &&
                    level.geoJson!.isNotEmpty &&
                    level.levelKey != null) {
                  final surveyLevel =
                      await convertGeojsontoSurveyLevel(level, id, );
                  await _repository.postSurveyLevelDB(
                      surveyLevel, level.levelKey!);
                  await _repository.updateSurveyLevelCount(
                      surveyLevel.length, level.levelKey!, levelId);
                }
              }

              return Right(localData);
            } catch (e) {
              return Left(MainFailure(
                  message: 'Error processing data: ${e.toString()}'));
            }
          },
        );
      } on DioException catch (e) {
        showSnackbar('Error on piechart loading', e.toString());
        return Left(MainFailure(message: e.toString()));
      }
    } else {
      try {
        final localData = await _repository.fetchMapLevelDB(levelId);
        if (localData != null) {
          return Right(localData);
        } else {
          return Left(MainFailure(message: 'User not found in local database'));
        }
      } catch (e) {
        return Left(
          MainFailure(
            message: 'Error fetching user from local database: ${e.toString()}',
          ),
        );
      }
    }
  }

  Future<Either<MainFailure, List<SurveyLevel>>> fetchSurveyLevel({
    required bool isRemote,
    required String levelId,
  }) async {
    if (isRemote) {
      return Left(
        MainFailure(
          message: 'Error fetching user from remote database}',
        ),
      );
    } else {
      try {
        final localData = await _repository.fetchSurveyLevelDB(levelId);
        if (localData != null) {
          return Right(localData);
        } else {
          return Left(MainFailure(message: 'User not found in local database'));
        }
      } catch (e) {
        return Left(
          MainFailure(
            message: 'Error fetching user from local database: ${e.toString()}',
          ),
        );
      }
    }
  }
}
