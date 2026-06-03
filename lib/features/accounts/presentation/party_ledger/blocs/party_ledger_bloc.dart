import 'package:bloc/bloc.dart';

import '../../../../../core/shared/shared_exports.dart';
import '../../../accounts_exports.dart';

class PartyLedgerBloc extends Bloc<PartyLedgerEvent, PartyLedgerState>
    with UsecaseExecuterMixin {
  final PartyLedgerUsecase partyLedgerUsecase;

  PartyLedgerBloc({required this.partyLedgerUsecase})
      : super(const PartyLedgerState()) {
    on<PartyLedgerSubmitted>(_onPartyLedgerSubmitted);
  }

  Future<void> _onPartyLedgerSubmitted(
    PartyLedgerSubmitted event,
    Emitter<PartyLedgerState> emit,
  ) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => partyLedgerUsecase(NoParams()),
      stateBuilder: (status, {data, error}) =>
          state.copyWith(apiStatus: status, data: data, message: error),
    );
  }
}
