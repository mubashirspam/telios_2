import 'package:dio/dio.dart';
import 'package:telios_2/view_model/auth/auth.dart';

final authService = AuthService();

Future<T> executeWithTokenRefresh<T>(Future<T> Function() apiCall) async {
  try {
    return await apiCall();
  } on DioException catch (e) {
    if (e.response?.statusCode == 401) {
      await authService.initializeToken();
      return await apiCall();
    }
    rethrow;
  }
}
