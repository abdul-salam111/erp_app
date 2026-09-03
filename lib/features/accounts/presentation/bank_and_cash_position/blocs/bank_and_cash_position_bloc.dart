import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../accounts_exports.dart';

class BankAndCashPositionBloc
    extends Bloc<BankAndCashPositionEvent, BankAndCashPositionState>
    with UsecaseExecuterMixin {
  final BankAndCashPositionUsecase bankAndCashPositionUsecase;

  BankAndCashPositionBloc({required this.bankAndCashPositionUsecase})
      : super(const BankAndCashPositionState()) {
    on<BankAndCashPositionSubmitted>(_onBankAndCashPositionSubmitted, transformer: droppable());
    add(const BankAndCashPositionSubmitted());
  }

  Future<void> _onBankAndCashPositionSubmitted(
    BankAndCashPositionSubmitted event,
    Emitter<BankAndCashPositionState> emit,
  ) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => bankAndCashPositionUsecase(NoParams()),
      stateBuilder: (status, {data, error}) => state.copyWith(
        apiStatus: status,
        items: data ?? state.items,
        message: error,
      ),
    );
  }
}
