part of 'ac_statement_cubit.dart';

class AcStatementState extends Equatable {
  final ApiStatus status;
  final List<LedgerStatementEntity> statements;
  final String? message;

  const AcStatementState({
    this.status = ApiStatus.INITIAL,
    this.statements = const [],
    this.message,
  });

  AcStatementState copyWith({
    ApiStatus? status,
    List<LedgerStatementEntity>? statements,
    String? message,
    bool clearMessage = false,
  }) {
    return AcStatementState(
      status:     status     ?? this.status,
      statements: statements ?? this.statements,
      message:    clearMessage ? null : (message ?? this.message),
    );
  }

  @override
  List<Object?> get props => [status, statements, message];
}
