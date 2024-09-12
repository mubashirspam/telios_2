import 'package:dio/dio.dart';

import '../helper/enums.dart';

class CacheException {
  final String message;

  CacheException(this.message);

  @override
  String toString() => message;
}

/// Represents a failure in the API.
class MainFailure {
  final String message;
  final int? statusCode;
  final FailureStatus failureStatus;

  /// Constructs a [MainFailure] object.
  ///
  /// The [message] parameter is the error message.
  /// The [statusCode] parameter is the HTTP status code associated with the error.
  /// The [failureStatus] parameter is the custom code representing the failure status.
  MainFailure({
    required this.message,
    this.statusCode,
    this.failureStatus = FailureStatus.clientFailure,
  });

  @override
  String toString() =>
      '$message Error Code $statusCode  Custom code : $failureStatus';
}

/// A class that handles exceptions thrown by the API.x
class AppException {
  /// Filters the API exceptions and returns the appropriate [MainFailure] object.
  ///
  /// The [e] parameter represents the exception that occurred.
  /// Returns a [MainFailure] object based on the type and status code of the exception.
  static MainFailure failures(Object e) {
    if (e is DioException) {
      if (e.response?.statusCode == 401) {
        return MainFailure(
            message: 'Unauthorized access. Please login again.',
            statusCode: 401,
            failureStatus: FailureStatus.unauthorized);
      } else if (e.response == null) {
        return MainFailure(
            message: 'Network error. Please check your internet connection.',
            failureStatus: FailureStatus.noInternet);
      } else if (e.response!.statusCode != null &&
          e.response!.statusCode! >= 400 &&
          e.response!.statusCode! < 500) {
        return MainFailure(
            message: 'Client error: ${e.response!.statusMessage}',
            failureStatus: FailureStatus.clientFailure,
            statusCode: e.response!.statusCode!);
      } else if (e.response!.statusCode != null &&
          e.response!.statusCode! >= 500 &&
          e.response!.statusCode! < 600) {
        return MainFailure(
            message: 'Server error: ${e.response!.statusMessage}',
            failureStatus: FailureStatus.serverFailure,
            statusCode: e.response!.statusCode!);
      } else {
        return MainFailure(
            message: 'An unknown error occurred. Please try again later.',
            failureStatus: FailureStatus.unknownError);
      }
    } else if (e is CacheException) {
      return MainFailure(
        message: 'Cache error: ${e.message}',
        failureStatus: FailureStatus.cacheError,
      );
    } else {
      return MainFailure(
          message: 'Error while parsing the data. Please try again.',
          failureStatus: FailureStatus.parsingError);
    }
  }
}


