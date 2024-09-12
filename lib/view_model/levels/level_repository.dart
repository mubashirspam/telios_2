import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../model/model.dart';
import '../../settings/settings.dart';
import 'db/db.dart';

/// Repository for handling operations related to different levels.
class LevelRepository {
  // Initialize database instances for assigned level, map level, and survey level.
  final _db = AssignedLevelDB.instance;
  final _dbMapLevel = MapLevelDB.instance;
  final _dbSurveyLevel = SurveyLevelDB.instance;

  /// Fetches assigned levels from the remote server.
  /// Returns either a [RemoteAssignedLeveleModel] on success or a [MainFailure] on failure.
  Future<Either<MainFailure, RemoteAssignedLeveleModel>>
      fetchAssignedLevelRemote({
    required String userId,
    required String token,
  }) async {
    try {
      log('API call => ${ApiEndPoints.assignedLevel}');

      // Set headers and data for the API request.
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      final data = json.encode({
        "query": [
          {"user_id": "=$userId"}
        ]
      });

      // Make the API request.
      final response = await Dio().request(
        ApiEndPoints.assignedLevel,
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      // Check the status code and return the appropriate response.
      if (response.statusCode == 200) {
        return Right(RemoteAssignedLeveleModel.fromJson(response.data));
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

  /// Fetches assigned levels from the local database.
  /// Returns a list of [AssignedLevel] or null.
  Future<List<AssignedLevel>?> fetchAssignedLevelDB(String userId) async {
    final localResponse = await _db.fetchAssignedLevel(userId);
    return Future.value(localResponse);
  }

  /// Stores assigned levels in the local database.
  /// If the data is null, the operation is skipped.
  Future<void> postAssignedLevelDB(
      List<AssignedLevel>? data, String userId) async {
    if (data == null) {
      log('Data is null');
      return;
    }

    await _db.postAssignedLevel(data, userId);
  }

  /// Clears assigned levels from the local database.
  /// Returns a boolean indicating success or failure.
  Future<bool> clearAssignedLevelDB(String userId) async {
    return await _db.deleteAssignedLevel();
  }

  // Map Level Operations

  /// Fetches map levels from the remote server.
  /// Returns either a [RemoteMapLevelModel] on success or a [MainFailure] on failure.
  Future<Either<MainFailure, RemoteMapLevelModel>> fetchMapLevelRemote({
    required String levelId,
    required String token,
  }) async {
    try {
      log('API call => ${ApiEndPoints.mapLevel}');

      // Set headers and data for the API request.
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      final data = json.encode({
        "query": [
          {"levelKey": "==$levelId"}
        ]
      });

      // Make the API request.
      final response = await Dio().request(
        ApiEndPoints.mapLevel,
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      // Check the status code and return the appropriate response.
      if (response.statusCode == 200) {
        return Right(RemoteMapLevelModel.fromJson(response.data));
      } else {
        return Left(AppException.failures(response.data));
      }
    } on DioException catch (e) {
      log(e.toString());
      return Left(AppException.failures(e));
    } catch (e, stackTrace) {
      log('Error occurred while fetching map levels: $e',
          stackTrace: stackTrace);
      return Left(MainFailure(message: e.toString()));
    }
  }

  /// Fetches map levels from the local database.
  /// Returns a list of [MapLevel] or null.
  Future<List<MapLevel>?> fetchMapLevelDB(String levelId) async {
    final localResponse = await _dbMapLevel.fetchMapLevelDB(levelId);
    return Future.value(localResponse);
  }

  /// Stores map levels in the local database.
  /// If the data is null, the operation is skipped.
  Future<void> postMapLevelDB(List<MapLevel>? data, String levelId) async {
    if (data == null) {
      return;
    }

    await _dbMapLevel.postMapLevelDB(data, levelId);
  }

  Future<void> updateSurveyLevelCount(
      int count, String levelId, String assignedLevelId) async {
    await _dbMapLevel.updateSurveyLevelCount(count, levelId, assignedLevelId);
  }

  /// Clears map levels from the local database.
  /// Returns a boolean indicating success or failure.
  Future<bool> clearMapLevelDB(String userId) async {
    return await _dbMapLevel.deleteMapLevelDB();
  }

  // Survey Level Operations

  /// Fetches survey levels from the local database.
  /// Returns a list of [SurveyLevel] or null.
  Future<List<SurveyLevel>?> fetchSurveyLevelDB(String levelId) async {
    final localResponse = await _dbSurveyLevel.fetchSurveyLevelDB(levelId);
    return Future.value(localResponse);
  }

  /// Stores survey levels in the local database.
  /// If the data is null, the operation is skipped.
  Future<void> postSurveyLevelDB(
      List<SurveyLevel>? data, String levelId) async {
    if (data == null) {
      return;
    }
    await _dbSurveyLevel.postSurveyLevelDB(data, levelId);
  }

  /// Clears survey levels from the local database.
  /// Returns a boolean indicating success or failure.
  Future<bool> clearSurveyLevelDB(String userId) async {
    return await _dbSurveyLevel.deleteSurveyLevelDB();
  }
}
