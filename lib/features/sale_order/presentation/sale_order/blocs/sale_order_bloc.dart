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
    on<SaleOrderFetched>(_onFetched);
  }

  Future<void> _onFetched(
    SaleOrderFetched event,
    Emitter<SaleOrderState> emit,
  ) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => saleorderUsecase.call(
        SaleOrderParams(
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
