import 'package:bloc/bloc.dart';

import '../../../../../core/shared/shared_exports.dart';
import '../../../accounts_exports.dart';

class CreditManagementBloc
    extends Bloc<CreditManagementEvent, CreditManagementState>
    with UsecaseExecuterMixin {
  final CreditManagementUsecase creditManagementUsecase;

  CreditManagementBloc({required this.creditManagementUsecase})
      : super(_initialState()) {
    on<CreditManagementSubmitted>(_onCreditManagementSubmitted);
    on<CreditManagementDateChanged>(
        (e, emit) => emit(state.copyWith(date: e.date)));
    on<CreditManagementFinancialYearChanged>(
        (e, emit) => emit(state.copyWith(financialYear: e.value)));
    on<CreditManagementCustomerTypeChanged>(
        (e, emit) => emit(state.copyWith(customerType: e.value)));
    on<CreditManagementGroupOnChanged>(
        (e, emit) => emit(state.copyWith(groupOn: e.value)));
    on<CreditManagementCreditRatingChanged>(
        (e, emit) => emit(state.copyWith(creditRating: e.value)));
    on<CreditManagementFilterCollapsed>(
        (e, emit) => emit(state.copyWith(filterCollapsed: e.collapsed)));
  }

  static CreditManagementState _initialState() =>
      CreditManagementState(date: DateTime.now());

  Future<void> _onCreditManagementSubmitted(
    CreditManagementSubmitted event,
    Emitter<CreditManagementState> emit,
  ) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => creditManagementUsecase(NoParams()),
      stateBuilder: (status, {data, error}) =>
          state.copyWith(apiStatus: status, data: data, message: error),
    );
  }
}
