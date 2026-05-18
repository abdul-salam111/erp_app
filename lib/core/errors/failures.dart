import '../networks/exceptions/app_exceptions.dart';

/// Domain-layer error type. Never leaks [AppException] past the repository.
sealed class Failure {
  final String message;
  const Failure(this.message);

  @override
  String toString() => message;

  /// Maps a data-layer [AppException] into the appropriate [Failure] subtype.
  static Failure fromException(AppException e) {
    final msg = e.message ?? 'An unexpected error occurred';
    return switch (e) {
      NoInternetException() => NetworkFailure(msg),
      UnauthorizedException() => UnauthorizedFailure(msg),
      ForbiddenException() => ForbiddenFailure(msg),
      NotFoundException() => NotFoundFailure(msg),
      RequestTimeoutException() => TimeoutFailure(msg),
      InvalidInputException() => ValidationFailure(msg),
      BadRequestException() => ValidationFailure(msg),
      InternalServerErrorException() => ServerFailure(msg),
      ServiceUnavailableException() => ServerFailure(msg),
      TooManyRequestsException() => ServerFailure(msg),
      MethodNotAllowedException() => ServerFailure(msg),
      FetchDataException() => ServerFailure(msg),
      _ => UnknownFailure(msg),
    };
  }
}

/// No internet / DNS / socket error.
final class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'No internet connection']);
}

/// 5xx or unexpected server-side error.
final class ServerFailure extends Failure {
  const ServerFailure([super.message = 'Server error']);
}

/// 401 — token missing or expired.
final class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure([super.message = 'Unauthorized']);
}

/// 403 — authenticated but not permitted.
final class ForbiddenFailure extends Failure {
  const ForbiddenFailure([super.message = 'Access forbidden']);
}

/// 404 — resource does not exist.
final class NotFoundFailure extends Failure {
  const NotFoundFailure([super.message = 'Resource not found']);
}

/// Connection / send / receive timeout.
final class TimeoutFailure extends Failure {
  const TimeoutFailure([super.message = 'Request timed out']);
}

/// 400 / 422 — bad request payload or validation error.
final class ValidationFailure extends Failure {
  const ValidationFailure([super.message = 'Invalid input']);
}

/// Anything that does not fit the above categories.
final class UnknownFailure extends Failure {
  const UnknownFailure([super.message = 'An unknown error occurred']);
}
