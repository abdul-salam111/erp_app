import 'package:bloc/bloc.dart';

import '../../../../../core/shared/shared_exports.dart';
import '../../../accounts_exports.dart';

class CustomerRecievablesBloc extends Bloc<CustomerRecievablesEvent, CustomerRecievablesState>
    with UsecaseExecuterMixin {
  final CustomerRecievablesUsecase customerRecievablesUsecase;

  CustomerRecievablesBloc({required this.customerRecievablesUsecase})
      : super(const CustomerRecievablesState()) {
    on<CustomerRecievablesSubmitted>(_onCustomerRecievablesSubmitted);
  }

  Future<void> _onCustomerRecievablesSubmitted(
    CustomerRecievablesSubmitted event,
    Emitter<CustomerRecievablesState> emit,
  ) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => customerRecievablesUsecase(NoParams()),
      stateBuilder: (status, {data, error}) => state.copyWith(
        apiStatus: status,
        items: data is List<CustomerReceivableItemEntity> ? data : null,
        message: error,
      ),
    );
  }
}
