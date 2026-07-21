import '../errors/failures.dart';

sealed class Result<T> {
  const Result();

  const factory Result.success(T data) = Success<T>;
  const factory Result.failure(Failure failure) = ResultError<T>;

  R when<R>({
    required R Function(T data) success,
    required R Function(Failure failure) failure,
  }) =>
      switch (this) {
        Success<T>(:final data) => success(data),
        ResultError<T>(failure: final f) => failure(f),
      };

  Result<R> map<R>(R Function(T data) transform) => switch (this) {
        Success<T>(:final data) => Result.success(transform(data)),
        ResultError<T>(:final failure) => Result.failure(failure),
      };

  bool get isSuccess => this is Success<T>;
}

final class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);
}

final class ResultError<T> extends Result<T> {
  final Failure failure;
  const ResultError(this.failure);
}
