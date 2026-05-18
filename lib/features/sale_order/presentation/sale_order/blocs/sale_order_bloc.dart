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
    on<SaleOrderSubmitted>(_onSaleOrderSubmitted);
  }

  Future<void> _onSaleOrderSubmitted(
    SaleOrderSubmitted event,
    Emitter<SaleOrderState> emit,
  ) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => saleorderUsecase.call(
        // TODO: Pass your parameters here
        NoParams(),
      ),
      stateBuilder: (status, {data, error}) =>
          state.copyWith(apiStatus: status, data: data, message: error),
    );
  }
}
