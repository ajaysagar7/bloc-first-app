import 'package:bloc_jsonplaceholder/core/error/failure.dart';
import 'package:dio/dio.dart';

Future<T> handleDioResponse<T>(
  Response<dynamic> response,
  T Function(dynamic json) fromJson, {
  String? errorMessage,
}) async {
  if (response.statusCode == 200) {
    return fromJson(response.data);
  } else if (response.statusCode == 404) {
    throw NotFoundFailure(message: errorMessage ?? 'Not found', statusCode: 404);
  } else if (response.statusCode == 403) {
    throw PermissionDeniedFailure(message: errorMessage ?? 'Permission denied', statusCode: 403);
  } else if (response.statusCode == 401) {
    throw AuthenticationFailure(message: errorMessage ?? 'Authentication failed', statusCode: 401);
  } else if (response.statusCode == 400) {
    throw ValidationFailure(message: errorMessage ?? 'Invalid request', statusCode: 400);
  } else if (response.statusCode == 500) {
    throw ServerFailure(message: errorMessage ?? 'Internal server error', statusCode: 500);
  } else if (response.statusCode == 503) {
    throw ServiceUnavailableFailure(message: errorMessage ?? 'Service unavailable', statusCode: 503);
  } else if (response.statusCode == 408) {
    throw TimeoutFailure(message: errorMessage ?? 'Request timeout', statusCode: 408);
  } else {
    throw UnknownErrorFailure(message: errorMessage ?? 'Unknown error occurred', statusCode: response.statusCode ?? 500);
  }
}

T handleDioException<T>(DioException e) {
  if (e.response != null) {
    throw handleDioResponse(
      e.response!,
      (json) => throw Exception('Unexpected response format'),
      errorMessage: 'Failed to process the response',
    );
  } else {
    throw const NetworkFailure(message: 'Network Error: Failed to host lookup site', statusCode: 0);
  }
}

T handleGenericError<T>(dynamic error) {
  throw UnknownErrorFailure(message: 'Unknown Error: $error', statusCode: 0);
}
