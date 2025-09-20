import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:telios_2/view_model/view_model.dart';
import '../../model/add_missing_response.dart';
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
    log('🚀 LevelService.fetchMapLevel() - START');
    log('📊 Parameters: isRemote=$isRemote, levelId=$levelId, unitId=$unitId, id=$id');
    log('🔑 Current userId: $userId, tokenExists: ${currentToken.isNotEmpty}');
    
    if (isRemote) {
      log('🌐 Fetching from remote source...');
      try {
        log('🔄 Refreshing token if needed...');
        await _authService.refreshTokenIfNeeded();
        log('✅ Token refresh completed');
        
        log('📡 Making API call to fetchMapLevelRemote...');
        final response = await executeWithTokenRefresh(() =>
            _repository.fetchMapLevelRemote(
                unitId: unitId, token: currentToken, userId: userId));
        log('📥 API response received');

        return response.fold(
          (failure) {
            log('❌ Remote API call failed: ${failure.message}');
            return Left(failure);
          },
          (success) async {
            log('✅ Remote API call successful');
            log('📝 Processing remote data...');
            try {
              log('🔄 Converting remote data to local format...');
              final localData = convertMapLevelRemoteToLocal(
                  remoteData: success, assignedLevelId: levelId);
              log('✅ Data conversion completed. Records count: ${localData.length}');
              
              log('💾 Saving data to local database...');
              await _repository.postMapLevelDB(localData, levelId);
              log('✅ Data saved to local database');

              log('🔄 Processing GeoJSON data for survey levels...');
              int processedLevels = 0;
              for (MapLevel level in localData) {
                log('📍 Processing level: ${level.levelKey}, hasGeoJson: ${level.geoJson != null && level.geoJson!.isNotEmpty}');
                if (level.geoJson != null &&
                    level.geoJson!.isNotEmpty &&
                    level.levelKey != null) {
                  log('🗺️ Converting GeoJSON to Survey Level for levelKey: ${level.levelKey}');
                  final surveyLevel = await convertGeojsontoSurveyLevel(
                    level,
                    id,
                  );
                  log('✅ Survey level conversion completed. Survey count: ${surveyLevel.length}');
                  
                  log('💾 Saving survey level to database...');
                  await _repository.postSurveyLevelDB(
                      surveyLevel, level.levelKey!);
                  log('✅ Survey level saved');
                  
                  log('🔢 Updating survey level count...');
                  await _repository.updateSurveyLevelCount(
                      surveyLevel.length, level.levelKey!, levelId);
                  log('✅ Survey level count updated');
                  
                  processedLevels++;
                }
              }
              log('🎯 Total levels processed: $processedLevels/${localData.length}');

              log('🎉 fetchMapLevel() completed successfully - Remote');
              return Right(localData);
            } catch (e) {
              log('💥 Error processing remote data: ${e.toString()}');
              log('📍 Stack trace: ${StackTrace.current}');
              return Left(MainFailure(
                  message: 'Error processing data: ${e.toString()}'));
            }
          },
        );
      } on DioException catch (e) {
        log('🚨 DioException occurred: ${e.toString()}');
        log('📍 Error type: ${e.type}');
        log('📍 Error message: ${e.message}');
        log('📍 Response data: ${e.response?.data}');
        log('📍 Status code: ${e.response?.statusCode}');
        showSnackbar('Error on piechart loading', e.toString());
        return Left(MainFailure(message: e.toString()));
      } catch (e) {
        log('💥 Unexpected error in remote fetch: ${e.toString()}');
        log('📍 Stack trace: ${StackTrace.current}');
        return Left(MainFailure(message: 'Unexpected error: ${e.toString()}'));
      }
    } else {
      log('💾 Fetching from local database...');
      try {
        log('🔍 Querying local database for levelId: $levelId');
        final localData = await _repository.fetchMapLevelDB(levelId);
        if (localData != null) {
          log('✅ Local data found. Records count: ${localData.length}');
          log('🎉 fetchMapLevel() completed successfully - Local');
          return Right(localData);
        } else {
          log('❌ No local data found for levelId: $levelId');
          return Left(MainFailure(message: 'User not found in local database'));
        }
      } catch (e) {
        log('💥 Error fetching from local database: ${e.toString()}');
        log('📍 Stack trace: ${StackTrace.current}');
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

  Future<Either<MainFailure, List<SurveyLevel>>> findmissingLevelRemote(
      String levelKey) async {
    try {
      await _authService.refreshTokenIfNeeded();
      return executeWithTokenRefresh(() async {
        final remoteData =
            await _repository.findMissingLevelRemote(levelKey, currentToken);
        final localData = convertMissingRemoteToLocal(
            remoteData: remoteData, assignedLevelId: levelKey);

        if (localData.isNotEmpty) {
          for (var element in localData) {
            await _repository.addmissingLevelDB(element);
          }
        }

        return localData;
      });
    } on DioException catch (e) {
      showSnackbar('Error on inserting survey', e.toString());
      return Left(MainFailure(message: e.toString()));
    }
  }

  Future<Either<MainFailure, AddMissingLevel>> addmissingLevelRemote(
      SurveyLevel surveyLevel) async {
    try {
      await _authService.refreshTokenIfNeeded();
      return executeWithTokenRefresh(
          () => _repository.addmissingLevelRemote(surveyLevel, currentToken));
    } on DioException catch (e) {
      showSnackbar('Error on inserting survey', e.toString());
      return Left(MainFailure(message: e.toString()));
    }
  }

  Future<void> addmissingLevelDB(SurveyLevel surveyLevel, int count) async {
    await _repository.addmissingLevelDB(surveyLevel);
    await _repository.updateSurveyLevelCount(count,
        surveyLevel.geoJsonLevelKey ?? '', surveyLevel.assignedLevelKey ?? '');
  }

  Future<bool> clearLevelsDB() async {
    await _repository.clearAssignedLevelDB();
    await _repository.clearMapLevelDB();
    await _repository.clearSurveyLevelDB();
    return true;
  }
}
