import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/constants/app_enums.dart';
import '../../../domain/entities/shared/ledger_statement_entity.dart';
import '../../../domain/usecases/party_ledger/get_party_statements_usecase.dart';

part 'ac_statement_state.dart';

class AcStatementCubit extends Cubit<AcStatementState> {
  final GetPartyStatementsUsecase _usecase;

  AcStatementCubit(this._usecase) : super(const AcStatementState());

  Future<void> fetch({
    required String fromDate,
    required String toDate,
    int? partyId,
  }) async {
    emit(state.copyWith(status: ApiStatus.LOADING));
    final result = await _usecase(
      GetPartyStatementsParams(
        fromDate: fromDate,
        toDate: toDate,
        partyId: partyId,
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
        clearMessage: true,
      )),
    );
  }
}
