sealed class AppException implements Exception {
  const AppException(this.message);
  final String message;

  @override
  String toString() => message;
}

class NetworkException extends AppException {
  const NetworkException([super.message = 'No network connection.']);
}

class ServerException extends AppException {
  const ServerException(super.message, {this.statusCode});
  final int? statusCode;
}

class LocationException extends AppException {
  const LocationException(super.message, {required this.kind});
  final LocationFailureKind kind;
}

enum LocationFailureKind {
  denied,
  permanentlyDenied,
  servicesDisabled,
  unavailable,
  timeout,
}

class AttendanceRuleException extends AppException {
  const AttendanceRuleException(super.message);
}

class LeaveRuleException extends AppException {
  const LeaveRuleException(super.message);
}
