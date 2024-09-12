import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../model/model.dart';
import '../../settings/settings.dart';
import 'db/user_db.dart';

class AuthRepository {
  Future<Either<MainFailure, LoginModel>> login({
    required String phoneNumber,
    required String password,
    required String token,
  }) async {
    try {
      log('Api call => ${ApiEndPoints.login} ');
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var data = json.encode({
        "query": [
          {"user_phone": "=$phoneNumber", "user_password": "=$password"},
          {"user_phone": "=$phoneNumber", "td_password": "=$password"}
        ],
        "script.prerequest": "Login_api",
        "script.prerequest.param": "$phoneNumber,$password"
      });
      var dio = Dio();
      final response = await dio.request(
        ApiEndPoints.login,
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );
      if (response.statusCode == 200) {
        return Right(LoginModel.fromJson(response.data));
      } else {
        return Left(AppException.failures(response.data));
      }
    } on DioException catch (e) {
      log(e.toString());
      return Left(AppException.failures(e));
    } catch (e, stackTrace) {
      log('Error occurred while fetching places: $e', stackTrace: stackTrace);
      return Left(MainFailure(message: e.toString()));
    }
  }

  Future<Either<MainFailure, InitializeModel>> initializeToken() async {
    log('Api call => ${ApiEndPoints.initializeToken} ');
    try {
      var headers = {
        'Authorization': 'Basic $token==',
        'Content-Type': 'application/json'
      };
      var dio = Dio();
      final response = await dio.post(
        ApiEndPoints.initializeToken,
        options: Options(
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        return Right(InitializeModel.fromJson(response.data));
      } else {
        return Left(AppException.failures(response.data));
      }
    } catch (e) {
      log(e.toString());
      return Left(MainFailure(message: e.toString()));
    }
  }

  Future<bool> logOutToken(String token) async {
    try {
      var dio = Dio();
      final response = await dio.request(
        '${ApiEndPoints.initializeToken}/$token',
        options: Options(
          method: 'DELETE',
        ),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<Either<MainFailure, UserModel>> fetchUserRemote({
    required String userId,
    required String token,
  }) async {
    log('Api call => ${ApiEndPoints.fetchUser} ');
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var data = json.encode({
        "query": [
          {"user_id": "=$userId"}
        ]
      });
      var dio = Dio();
      final response = await dio.request(
        ApiEndPoints.fetchUser,
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        final data = UserModel.fromJson(response.data);
        log(data.response!.user!.first.userData!.userName.toString());
        return Right(data);
      } else {
        return Left(AppException.failures(response.data));
      }
    } on DioException catch (e) {
      log(e.toString());
      return Left(AppException.failures(e));
    } catch (e, stackTrace) {
      log('Error occurred while fetching places: $e', stackTrace: stackTrace);
      return Left(MainFailure(message: e.toString()));
    }
  }

  Future<UserData?> fetchUserDB(String userId) async {
    final localResponse = await UserDB.instance.fetchUser(userId);

    return Future.value(localResponse);
  }

  Future<void> postUserDB(UserData? userData) async {
    if (userData == null) {
      return;
    }
    await UserDB.instance.postData(userData);
  }

  Future<bool> clearUserDB(String userId) async {
    
    return await UserDB.instance.deleteUser(userId);
  }

  Future<void> saveUserId(String userId) async {
    await prefs.setString(userIdKey, userId);
    await prefs.setBool(isLoginedKey, true);
  }

  Future<void> saveToken(String token) async {
    await prefs.setString(sessionTokenKey, token);
  }





  Future<String?> getToken() async {
    return prefs.getString(sessionTokenKey);
  }

  Future<void> saveTokenExpiration(DateTime expirationTime) async {
    await prefs.setString(tokenExpirationKey, expirationTime.toIso8601String());
  }

  Future<DateTime?> getTokenExpiration() async {
    final expirationString = prefs.getString(tokenExpirationKey);
    return expirationString != null ? DateTime.parse(expirationString) : null;
  }

  Future<bool> isTokenExpired() async {
    final expiration = await getTokenExpiration();
    return expiration == null || DateTime.now().isAfter(expiration);
  }

  Future<void> clearUserId() async {
    await prefs.remove(userIdKey);
    await prefs.setBool(isLoginedKey, false);
    await prefs.setBool(isTrapdorKey, false);
  }

  Future<void> setTrapdor(p) async {
    await prefs.setBool(isTrapdorKey, p);
  }

  Future<void> setAdvancedUser(p) async {
    await prefs.setBool(isTrapdorKey, p);
  }

  Future<String?> getUserId() async {
    return prefs.getString(userIdKey);
  }

  Future<bool> isLoggedIn() async {
    return prefs.getBool(isLoginedKey) ?? false;
  }

  Future<bool> isTrapdor() async {
    return prefs.getBool(isTrapdorKey) ?? false;
  }

  Future<bool> isAdvancedUser() async {
    return prefs.getBool(isTrapdorKey) ?? false;
  }
}
