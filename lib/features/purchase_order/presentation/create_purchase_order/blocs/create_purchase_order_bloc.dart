import 'package:bloc/bloc.dart';

import '../../../../../core/shared/shared_exports.dart';
import '../../../purchase_order_exports.dart';

class CreatePurchaseOrderBloc extends Bloc<CreatePurchaseOrderEvent, CreatePurchaseOrderState>
    with UsecaseExecuterMixin {
  final CreatePurchaseOrderUsecase createPurchaseOrderUsecase;

  CreatePurchaseOrderBloc({required this.createPurchaseOrderUsecase})
      : super(const CreatePurchaseOrderState()) {
    on<CreatePurchaseOrderSubmitted>(_onCreatePurchaseOrderSubmitted);
  }

  Future<void> _onCreatePurchaseOrderSubmitted(
    CreatePurchaseOrderSubmitted event,
    Emitter<CreatePurchaseOrderState> emit,
  ) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => createPurchaseOrderUsecase(NoParams()),
      stateBuilder: (status, {data, error}) =>
          state.copyWith(apiStatus: status, data: data, message: error),
    );
  }
}
