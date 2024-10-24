import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
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
      log('Error occurred while initializing token: $e', stackTrace: stackTrace);
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
