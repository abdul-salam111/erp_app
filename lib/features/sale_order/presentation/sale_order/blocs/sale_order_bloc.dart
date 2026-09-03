import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../domain/usecases/sale_order_usecase.dart';
import 'sale_order_event.dart';
import 'sale_order_state.dart';

class SaleOrderBloc extends Bloc<SaleOrderEvent, SaleOrderState>
    with UsecaseExecuterMixin {
  final SaleOrderUsecase saleorderUsecase;

  SaleOrderBloc({required this.saleorderUsecase})
      : super(const SaleOrderState()) {
    on<SaleOrderFetched>(_onFetched, transformer: droppable());
    on<SaleOrderSearchChanged>(_onSearchChanged, transformer: restartable());
    on<SaleOrderLoadMore>(_onLoadMore, transformer: sequential());
  }

  Future<void> _onFetched(
    SaleOrderFetched event,
    Emitter<SaleOrderState> emit,
  ) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => saleorderUsecase.call(NoParams()),
      stateBuilder: (status, {data, error}) => state.copyWith(
        apiStatus: status,
        orders: data ?? [],
        message: error,
        currentPage: 1,
      ),
    );
  }

  void _onSearchChanged(
    SaleOrderSearchChanged event,
    Emitter<SaleOrderState> emit,
  ) {
    emit(state.copyWith(searchQuery: event.query, currentPage: 1));
  }

  void _onLoadMore(
    SaleOrderLoadMore event,
    Emitter<SaleOrderState> emit,
  ) {
    if (!state.hasMore) return;
    emit(state.copyWith(currentPage: state.currentPage + 1));
  }
}
