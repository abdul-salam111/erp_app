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
    on<PurchaseOrderFetched>(_onFetched);
  }

  Future<void> _onFetched(
    PurchaseOrderFetched event,
    Emitter<PurchaseOrderState> emit,
  ) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => purchaseorderUsecase.call(
        PurchaseOrderParams(
          fromDate: event.fromDate,
          toDate: event.toDate,
          search: event.search,
        ),
      ),
      stateBuilder: (status, {data, error}) =>
          state.copyWith(apiStatus: status, orders: data ?? [], message: error),
    );
  }
}
