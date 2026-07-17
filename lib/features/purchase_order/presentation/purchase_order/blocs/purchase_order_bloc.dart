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
    on<PurchaseOrderSearchChanged>(_onSearchChanged);
    on<PurchaseOrderLoadMore>(_onLoadMore);
  }

  Future<void> _onFetched(
    PurchaseOrderFetched event,
    Emitter<PurchaseOrderState> emit,
  ) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => purchaseorderUsecase.call(NoParams()),
      stateBuilder: (status, {data, error}) => state.copyWith(
        apiStatus: status,
        orders: data ?? [],
        message: error,
        currentPage: 1,
      ),
    );
  }

  void _onSearchChanged(
    PurchaseOrderSearchChanged event,
    Emitter<PurchaseOrderState> emit,
  ) {
    emit(state.copyWith(searchQuery: event.query, currentPage: 1));
  }

  void _onLoadMore(
    PurchaseOrderLoadMore event,
    Emitter<PurchaseOrderState> emit,
  ) {
    if (!state.hasMore) return;
    emit(state.copyWith(currentPage: state.currentPage + 1));
  }
}
