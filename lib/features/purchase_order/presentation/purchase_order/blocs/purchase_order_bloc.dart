import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../domain/usecases/purchase_order_usecase.dart';
import 'purchase_order_event.dart';
import 'purchase_order_state.dart';

class PurchaseOrderBloc extends Bloc<PurchaseOrderEvent, PurchaseOrderState>
    with UsecaseExecuterMixin {
  final PurchaseOrderUsecase purchaseorderUsecase;

  PurchaseOrderBloc({required this.purchaseorderUsecase})
      : super(const PurchaseOrderState()) {
    on<PurchaseOrderSubmitted>(_onPurchaseOrderSubmitted);
  }

  Future<void> _onPurchaseOrderSubmitted(
    PurchaseOrderSubmitted event,
    Emitter<PurchaseOrderState> emit,
  ) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => purchaseorderUsecase.call(
        // TODO: Pass your parameters here
        NoParams(),
      ),
      stateBuilder: (status, {data, error}) =>
          state.copyWith(apiStatus: status, data: data, message: error),
    );
  }
}
