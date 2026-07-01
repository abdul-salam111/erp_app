import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/constants/app_enums.dart';
import '../../../domain/entities/ledger_statement_entity.dart';
import '../../../domain/usecases/get_account_statements_usecase.dart';

part 'ac_statement_state.dart';

class AcStatementCubit extends Cubit<AcStatementState> {
  final GetAccountStatementsUsecase _usecase;

  AcStatementCubit(this._usecase) : super(const AcStatementState());

  Future<void> fetch({
    required String fromDate,
    required String toDate,
    int? accountId,
  }) async {
    emit(state.copyWith(status: ApiStatus.LOADING));
    final result = await _usecase(
      GetAccountStatementsParams(
        fromDate: fromDate,
        toDate: toDate,
        accountId: accountId,
      ),
    );
    result.fold(
      (failure) => emit(state.copyWith(
        status: ApiStatus.FAILURE,
        message: failure.message,
        statements: [],
      )),
      (statements) => emit(state.copyWith(
        status: ApiStatus.SUCCESS,
        statements: statements,
      )),
    );
  }
}
