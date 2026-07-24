class AppException implements Exception {
  final String? _message;
  final String? _prefix;

  AppException([this._message, this._prefix]);

  String? get message => _message;

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

// No Internet Exception
class NoInternetException extends AppException {
  NoInternetException([String? message]) : super(message, '');
}

class UnauthorizedException extends AppException {
  UnauthorizedException([String? message]) : super(message, '');
}

class RequestTimeoutException extends AppException {
  RequestTimeoutException([String? message]) : super(message, '');
}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, '');
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, '');
}

class NotFoundException extends AppException {
  NotFoundException([String? message]) : super(message, '');
}

class InternalServerErrorException extends AppException {
  InternalServerErrorException([String? message]) : super(message, '');
}

class ServiceUnavailableException extends AppException {
  ServiceUnavailableException([String? message]) : super(message, '');
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, '');
}

class ForbiddenException extends AppException {
  ForbiddenException([String? message]) : super(message, '');
}

class TooManyRequestsException extends AppException {
  TooManyRequestsException([String? message]) : super(message, '');
}

class MethodNotAllowedException extends AppException {
  MethodNotAllowedException([String? message]) : super(message, '');
}
