import 'package:bloc/bloc.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../domain/usecases/create_sale_order_usecase.dart';
import 'create_sale_order_event.dart';
import 'create_sale_order_state.dart';

class CreateSaleOrderBloc
    extends Bloc<CreateSaleOrderEvent, CreateSaleOrderState>
    with UsecaseExecuterMixin {
  final CreateSaleOrderUsecase createSaleOrderUsecase;

  CreateSaleOrderBloc({required this.createSaleOrderUsecase})
      : super(_initialState()) {
    on<CreateSaleOrderSubmitted>(_onCreateSaleOrderSubmitted);
    on<SaleOrderDateChanged>(_onDateChanged);
    on<SaleOrderRowAdded>(_onRowAdded);
    on<SaleOrderRowRemoved>(_onRowRemoved);
    on<SaleOrderRowUpdated>(_onRowUpdated);
  }

  Future<void> _onCreateSaleOrderSubmitted(
    CreateSaleOrderSubmitted event,
    Emitter<CreateSaleOrderState> emit,
  ) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => createSaleOrderUsecase(NoParams()),
      stateBuilder: (status, {data, error}) =>
          state.copyWith(apiStatus: status, data: data, message: error),
    );
  }

  void _onDateChanged(
    SaleOrderDateChanged event,
    Emitter<CreateSaleOrderState> emit,
  ) {
    emit(state.copyWith(date: event.date));
  }

  void _onRowAdded(
    SaleOrderRowAdded event,
    Emitter<CreateSaleOrderState> emit,
  ) {
    emit(state.copyWith(rows: [...state.rows, event.item]));
  }

  void _onRowRemoved(
    SaleOrderRowRemoved event,
    Emitter<CreateSaleOrderState> emit,
  ) {
    final updated = [...state.rows]..removeAt(event.index);
    emit(state.copyWith(rows: updated));
  }

  void _onRowUpdated(
    SaleOrderRowUpdated event,
    Emitter<CreateSaleOrderState> emit,
  ) {
    final updated = [...state.rows]..[event.index] = event.item;
    emit(state.copyWith(rows: updated));
  }

  static CreateSaleOrderState _initialState() {
    return CreateSaleOrderState(date: DateTime.now());
  }
}
