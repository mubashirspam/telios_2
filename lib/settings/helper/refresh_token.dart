import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:telios_2/settings/api/api_exceptions.dart';
import 'package:telios_2/settings/helper/dialogues.dart';
import 'package:telios_2/view_model/auth/auth.dart';

final authService = AuthService();

// Future<T> executeWithTokenRefresh<T>(Future<T> Function() apiCall) async {
//   try {
//     return await apiCall();
//   } on DioException catch (e) {
//     if (e.response?.statusCode == 401) {
//       await authService.initializeToken();
//       return await apiCall();
//     }
//     rethrow;
//   }
// }


Future<Either<MainFailure, T>> executeWithTokenRefresh<T>(
    Future<T> Function() apiCall) async {
  try {
    final result = await apiCall();
    return Right(result);
  } on DioException catch (e) {
    if (e.response?.statusCode == 401) {
      try {
        await authService.initializeToken();
        final result = await apiCall();
        return Right(result);
      } catch (retryError) {
        return Left(MainFailure(
            message: 'Failed to refresh token: ${retryError.toString()}'));
      }
    }
    
    // Handle specific status codes
    if (e.response?.statusCode == 500) {
      // showSnackbar(
      //     'Server Error', 'An internal server error occurred. Please try again later.');
      return Left(MainFailure(message: 'Internal Server Error: ${e.toString()}'));
    }
    
    // Handle other Dio errors
    showSnackbar('Network Error', 'Failed to complete request: ${e.message}');
    return Left(MainFailure(message: e.toString()));
  } catch (e) {
    // Handle any other errors
    showSnackbar('Error', 'An unexpected error occurred: $e');
    return Left(MainFailure(message: e.toString()));
  }
}