import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure({required this.message, required this.statusCode});

  final String message;
  final int statusCode;

  String get errorMessage => 'Error $statusCode: $message';

  @override
  List<Object?> get props => [message, statusCode];
}

class ServerFailure extends Failure {
  const ServerFailure({required String message, required int statusCode})
      : super(message: message, statusCode: statusCode);
}
class ServiceUnavailableFailure extends Failure {
  const ServiceUnavailableFailure({required String message, required int statusCode})
      : super(message: message, statusCode: statusCode);
}


class CacheFailure extends Failure {
  const CacheFailure({required String message, required int statusCode})
      : super(message: message, statusCode: statusCode);
}

class NetworkFailure extends Failure {
  const NetworkFailure({required String message, required int statusCode})
      : super(message: message, statusCode: statusCode);
}

class AuthenticationFailure extends Failure {
  const AuthenticationFailure({required String message, required int statusCode})
      : super(message: message, statusCode: statusCode);
}

class ValidationFailure extends Failure {
  const ValidationFailure({required String message, required int statusCode})
      : super(message: message, statusCode: statusCode);
}

class NotFoundFailure extends Failure {
  const NotFoundFailure({required String message, required int statusCode})
      : super(message: message, statusCode: statusCode);
}

class PermissionDeniedFailure extends Failure {
  const PermissionDeniedFailure({required String message, required int statusCode})
      : super(message: message, statusCode: statusCode);
}

class TimeoutFailure extends Failure {
  const TimeoutFailure({required String message, required int statusCode})
      : super(message: message, statusCode: statusCode);
}

class UnknownErrorFailure extends Failure {
  const UnknownErrorFailure({required String message, required int statusCode})
      : super(message: message, statusCode: statusCode);
}

// Add more specific error classes as needed
