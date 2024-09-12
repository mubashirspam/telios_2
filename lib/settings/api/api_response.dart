import '../helper/enums.dart';
import 'api_exceptions.dart';

/// Represents the response from an API call.
class ApiResponse<T> {
  final T? data;
  final MainFailure? failure;
  final ResponseState state;

  /// Constructs an [ApiResponse] object.
  ///
  /// [state] represents the state of the API response.
  /// [data] contains the response data.
  /// [failure] contains the failure information if the API call failed.
  ApiResponse({
    required this.data,
    required this.failure,
    this.state = ResponseState.initial,
  });

  /// Constructs an initial [ApiResponse] object.
  factory ApiResponse.initial() {
    return ApiResponse(
      state: ResponseState.initial,
      data: null,
      failure: null,
    );
  }

  /// Constructs a loading [ApiResponse] object.
  factory ApiResponse.loading() {
    return ApiResponse(
      state: ResponseState.loading,
      data: null,
      failure: null,
    );
  }

  /// Constructs a completed [ApiResponse] object.
  ///
  /// [data] contains the response data.
  factory ApiResponse.completed(T data) {
    return ApiResponse(
      state: ResponseState.completed,
      data: data,
      failure: null,
    );
  }

  /// Constructs an error [ApiResponse] object.
  ///
  /// [failure] contains the failure information.
  factory ApiResponse.error(MainFailure failure) {
    return ApiResponse(
      state: ResponseState.error,
      data: null,
      failure: failure,
    );
  }

  /// Constructs a refreshing [ApiResponse] object.
  ///
  /// [data] contains the response data.
  factory ApiResponse.refreshing(T data) {
    return ApiResponse(
      state: ResponseState.refreshing,
      data: data,
      failure: null,
    );
  }
}

// /// Represents the response from an API call with async handling using Completer.
// class ApiResponse<T> {
//   final Completer<T> _completer = Completer<T>();
//   T? _data;
//   MainFailure? _failure;
//   ResponseState _state;

//   /// Constructs an [ApiResponse] object with an initial state.
//   ApiResponse() : _state = ResponseState.initial;

//   /// Returns the current state of the response.
//   ResponseState get state => _state;

//   /// Returns the data if the API call was successful, otherwise `null`.
//   T? get data => _data;

//   /// Returns the failure information if the API call failed, otherwise `null`.
//   MainFailure? get failure => _failure;

//   /// Sets the state to loading.
//   void setLoading() {
//     _state = ResponseState.loading;
//   }

//   /// Completes the response with the provided data and sets the state to completed.
//   void complete(T data) {
//     _data = data;
//     _state = ResponseState.completed;
//     _completer.complete(data); // Complete the async task.
//   }

//   /// Completes the response with an error and sets the state to error.
//   void completeWithError(MainFailure failure) {
//     _failure = failure;
//     _state = ResponseState.error;
//     _completer.completeError(failure); // Complete the async task with error.
//   }

//   /// Sets the state to refreshing while keeping the existing data.
//   void setRefreshing(T data) {
//     _data = data;
//     _state = ResponseState.refreshing;
//   }

//   /// Returns a Future that will complete when the response is available.
//   Future<T> get future => _completer.future;

//   /// Factory method to create an initial [ApiResponse].
//   static ApiResponse<T> initial<T>() {
//     return ApiResponse<T>().._state = ResponseState.initial;
//   }

//   /// Factory method to create a loading [ApiResponse].
//   static ApiResponse<T> loading<T>() {
//     return ApiResponse<T>().._state = ResponseState.loading;
//   }

//   /// Factory method to create a refreshing [ApiResponse].
//   static ApiResponse<T> refreshing<T>(T data) {
//     return ApiResponse<T>()
//       .._state = ResponseState.refreshing
//       .._data = data;
//   }
// }
