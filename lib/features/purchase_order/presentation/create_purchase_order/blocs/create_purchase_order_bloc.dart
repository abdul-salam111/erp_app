import 'package:bloc/bloc.dart';

import '../../../../../core/shared/shared_exports.dart';
import '../../../purchase_order_exports.dart';

class CreatePurchaseOrderBloc
    extends Bloc<CreatePurchaseOrderEvent, CreatePurchaseOrderState>
    with UsecaseExecuterMixin {
  final CreatePurchaseOrderUsecase createPurchaseOrderUsecase;

  CreatePurchaseOrderBloc({required this.createPurchaseOrderUsecase})
    : super(_initialState()) {
    on<CreatePurchaseOrderSubmitted>(_onCreatePurchaseOrderSubmitted);
    on<PurchaseOrderDateChanged>(_onDateChanged);
    on<PurchaseOrderRowAdded>(_onRowAdded);
    on<PurchaseOrderRowRemoved>(_onRowRemoved);
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

  void _onDateChanged(
    PurchaseOrderDateChanged event,
    Emitter<CreatePurchaseOrderState> emit,
  ) {
    emit(state.copyWith(date: event.date));
  }

  void _onRowAdded(
    PurchaseOrderRowAdded event,
    Emitter<CreatePurchaseOrderState> emit,
  ) {
    emit(state.copyWith(rows: [...state.rows, event.item]));
  }

  void _onRowRemoved(
    PurchaseOrderRowRemoved event,
    Emitter<CreatePurchaseOrderState> emit,
  ) {
    final updated = [...state.rows]..removeAt(event.index);
    emit(state.copyWith(rows: updated));
  }

  static CreatePurchaseOrderState _initialState() {
    final now = DateTime.now();
    return CreatePurchaseOrderState(date: now);
  }
}