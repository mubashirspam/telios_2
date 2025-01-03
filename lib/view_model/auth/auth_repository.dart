import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../model/model.dart';
import '../../settings/settings.dart';
import 'db/user_db.dart';

class AuthRepository {
  final Dio _dio = Dio();
  Future<LoginModel> login(
      {required String phoneNumber,
      required String password,
      required String token}) async {
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

      final response = await _dio.post(
        ApiEndPoints.login,
        options: Options(headers: headers),
        data: data,
      );

      return LoginModel.fromJson(response.data);
    } on DioException catch (e, stackTrace) {
      log('Error occurred while login: $e', stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<InitializeModel> initializeToken() async {
    log('Api call => ${ApiEndPoints.initializeToken} ');
    try {
      var headers = {
        'Authorization': 'Basic $token==',
        'Content-Type': 'application/json'
      };

      final response = await _dio.post(
        ApiEndPoints.initializeToken,
        options: Options(
          headers: headers,
        ),
      );

      return InitializeModel.fromJson(response.data);
    } catch (e, stackTrace) {
      log('Error occurred while initializing token: $e',
          stackTrace: stackTrace);
      rethrow;
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

  Future<UserModel> fetchUserRemote({
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

      final response = await _dio.post(
        ApiEndPoints.fetchUser,
        options: Options(headers: headers),
        data: data,
      );

      return UserModel.fromJson(response.data);
    } on DioException catch (e, stackTrace) {
      log('Error occurred while fetching user: $e', stackTrace: stackTrace);
      rethrow;
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
    debugPrint('Saving user ID: $userId');
    await setString(userIdKey, userId);
    await setBool(isLoginedKey, true);
    debugPrint('User ID saved, isLoggedIn set to true');
    log('User ID saved: $userId');
    log('isLoginedKey saved: $isLoginedKey');
  }

  Future<void> saveToken(String token) async {
    debugPrint('Saving token: $token');
    await setString(sessionTokenKey, token);
  }

  Future<String?> getToken() async {
    final token = await getString(sessionTokenKey);
    debugPrint('Retrieved token: $token');
    return token;
  }

  Future<void> saveTokenExpiration(DateTime expirationTime) async {
    debugPrint('Saving token expiration: $expirationTime');
    await setString(tokenExpirationKey, expirationTime.toIso8601String());
  }

  Future<DateTime?> getTokenExpiration() async {
    final expirationString = await getString(tokenExpirationKey);
    final expiration = expirationString != null ? DateTime.parse(expirationString) : null;
    debugPrint('Token expiration: $expiration');
    return expiration;
  }

  Future<bool> isTokenExpired() async {
    final expiration = await getTokenExpiration();
    final isExpired = expiration == null || DateTime.now().isAfter(expiration);
    debugPrint('Token expired: $isExpired (expiration: $expiration)');
    return isExpired;
  }

  Future<void> clearUserId() async {
    debugPrint('Clearing user ID and auth state');
    await remove(userIdKey);
    await setBool(isLoginedKey, false);
    await setBool(isTrapdorKey, false);
    debugPrint('User ID cleared, auth state reset');
  }

  Future<String?> getUserId() async {
    final id = await getString(userIdKey);
    debugPrint('Retrieved user ID: $id');
    return id;
  }

  Future<bool> isLoggedIn() async {
    final isLoggedIn = await getBool(isLoginedKey);
    debugPrint('isLoggedIn from storage: $isLoggedIn');
    return isLoggedIn;
  }

  Future<bool> isTrapdor() async {
    final isTrapdor = await getBool(isTrapdorKey);
    debugPrint('isTrapdor from storage: $isTrapdor');
    return isTrapdor;
  }

  Future<bool> isAdvancedUser() async {
    final isAdvanced = await getBool(isTrapdorKey);
    debugPrint('isAdvancedUser from storage: $isAdvanced');
    return isAdvanced;
  }

  Future<void> setTrapdor(p) async {
    await setBool(isTrapdorKey, p);
  }

  Future<void> setAdvancedUser(p) async {
    await setBool(isTrapdorKey, p);
  }
}
