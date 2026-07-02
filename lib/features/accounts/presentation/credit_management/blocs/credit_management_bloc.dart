import 'package:bloc/bloc.dart';

import '../../../../../core/constants/app_enums.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../accounts_exports.dart';

class CreditManagementBloc
    extends Bloc<CreditManagementEvent, CreditManagementState>
    with UsecaseExecuterMixin {
  final GetPartyListUsecase getPartyListUsecase;

  CreditManagementBloc({required this.getPartyListUsecase})
      : super(_initialState()) {
    on<CreditManagementSubmitted>(_onSubmitted);
    on<CreditManagementDateChanged>(
      (e, emit) => emit(state.copyWith(date: e.date)),
    );
    on<CreditManagementPartySelected>(
      (e, emit) => emit(state.copyWith(selectedPartyId: e.partyId)),
    );
    on<CreditManagementPartiesFetched>(_onPartiesFetched);
    on<CreditManagementFilterCollapsed>(
      (e, emit) => emit(state.copyWith(filterCollapsed: e.collapsed)),
    );

    add(const CreditManagementPartiesFetched());
  }

  static CreditManagementState _initialState() =>
      CreditManagementState(date: DateTime.now());

  Future<void> _onPartiesFetched(
    CreditManagementPartiesFetched event,
    Emitter<CreditManagementState> emit,
  ) async {
    emit(state.copyWith(partiesStatus: ApiStatus.LOADING));
    final result = await getPartyListUsecase(NoParams());
    result.fold(
      (failure) => emit(state.copyWith(
        partiesStatus: ApiStatus.FAILURE,
        message: failure.message,
      )),
      (parties) => emit(state.copyWith(
        partiesStatus: ApiStatus.SUCCESS,
        parties: parties,
      )),
    );
  }

  Future<void> _onSubmitted(
    CreditManagementSubmitted event,
    Emitter<CreditManagementState> emit,
  ) async {
    // TODO: wire up usecase when API is ready
  }
}
