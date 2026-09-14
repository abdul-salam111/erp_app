import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

import '../../../../../core/shared/shared_exports.dart';
import '../../../accounts_exports.dart';

class CustomerRecievablesBloc
    extends Bloc<CustomerRecievablesEvent, CustomerRecievablesState>
    with UsecaseExecuterMixin {
  final CustomerRecievablesUsecase customerRecievablesUsecase;

  CustomerRecievablesBloc({required this.customerRecievablesUsecase})
    : super(const CustomerRecievablesState()) {
    on<CustomerRecievablesSubmitted>(_onSubmitted, transformer: restartable());
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
}
