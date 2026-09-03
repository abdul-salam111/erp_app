import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

import '../../../../../core/constants/app_enums.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../accounts_exports.dart';

class CreditManagementBloc
    extends Bloc<CreditManagementEvent, CreditManagementState>
    with UsecaseExecuterMixin {
  final GetPartyListUsecase getPartyListUsecase;
  final GetCustomerReceivableAgingUsecase getCustomerReceivableAgingUsecase;

  CreditManagementBloc({
    required this.getPartyListUsecase,
    required this.getCustomerReceivableAgingUsecase,
  }) : super(_initialState()) {
    on<CreditManagementSubmitted>(_onSubmitted, transformer: restartable());
    on<CreditManagementDateChanged>(
      (e, emit) => emit(state.copyWith(date: e.date)),
    );
    on<CreditManagementPartySelected>(
      (e, emit) => emit(state.copyWith(selectedPartyId: e.partyId)),
    );
    on<CreditManagementPartyCleared>(
      (e, emit) => emit(state.copyWith(clearSelectedPartyId: true)),
    );
    on<CreditManagementFilterCollapsed>(
      (e, emit) => emit(state.copyWith(filterCollapsed: e.collapsed)),
    );
  }

  static CreditManagementState _initialState() =>
      CreditManagementState(date: DateTime.now());

  Future<void> _onSubmitted(
    CreditManagementSubmitted event,
    Emitter<CreditManagementState> emit,
  ) async {
    emit(state.copyWith(
      apiStatus: ApiStatus.LOADING,
      partiesStatus: ApiStatus.LOADING,
    ));

    final partiesFuture = getPartyListUsecase(NoParams());
    final agingFuture = getCustomerReceivableAgingUsecase(
      GetCustomerReceivableAgingParams(
        toDate: state.date.format('yyyy-MM-dd'),
        partyId: state.selectedPartyId,
      ),
    );

    await Future.wait([
      partiesFuture.then((r) => r.when(
            failure: (f) => emit(state.copyWith(
              partiesStatus: ApiStatus.FAILURE,
              message: f.message,
            )),
            success: (parties) => emit(state.copyWith(
              partiesStatus: ApiStatus.SUCCESS,
              parties: parties,
              clearMessage: true,
            )),
          )),
      agingFuture.then((r) => r.when(
            failure: (f) => emit(state.copyWith(
              apiStatus: ApiStatus.FAILURE,
              message: f.message,
            )),
            success: (data) => emit(state.copyWith(
              apiStatus: ApiStatus.SUCCESS,
              agingData: data,
              clearMessage: true,
            )),
          )),
    ]);
  }
}
