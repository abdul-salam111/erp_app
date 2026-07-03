import 'package:bloc/bloc.dart';

import '../../../../../core/constants/app_enums.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../accounts_exports.dart';

class CustomerRecievablesBloc
    extends Bloc<CustomerRecievablesEvent, CustomerRecievablesState>
    with UsecaseExecuterMixin {
  final CustomerRecievablesUsecase customerRecievablesUsecase;
  final GetPartyListUsecase getPartyListUsecase;

  CustomerRecievablesBloc({
    required this.customerRecievablesUsecase,
    required this.getPartyListUsecase,
  }) : super(const CustomerRecievablesState()) {
    on<CustomerRecievablesSubmitted>(_onSubmitted);
    on<CustomerRecievablesPartiesFetched>(_onPartiesFetched);

    add(const CustomerRecievablesPartiesFetched());
  }

  Future<void> _onSubmitted(
    CustomerRecievablesSubmitted event,
    Emitter<CustomerRecievablesState> emit,
  ) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => customerRecievablesUsecase(
        CustomerRecievablesParams(
          fromDate: event.fromDate,
          toDate: event.toDate,
        ),
      ),
      stateBuilder: (status, {data, error}) => state.copyWith(
        apiStatus: status,
        items: data is List<CustomerReceivableItemEntity> ? data : null,
        message: error,
      ),
    );
  }

  Future<void> _onPartiesFetched(
    CustomerRecievablesPartiesFetched event,
    Emitter<CustomerRecievablesState> emit,
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
}
