import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../domain/usecases/inventory_usecase.dart';
import 'inventory_event.dart';
import 'inventory_state.dart';

class InventoryBloc extends Bloc<InventoryEvent, InventoryState>
    with UsecaseExecuterMixin {
  final InventoryUsecase inventoryUsecase;

  InventoryBloc({required this.inventoryUsecase})
      : super(const InventoryState()) {
    on<InventorySubmitted>(_onInventorySubmitted);
  }

  Future<void> _onInventorySubmitted(
    InventorySubmitted event,
    Emitter<InventoryState> emit,
  ) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => inventoryUsecase.call(
        // TODO: Pass your parameters here
        NoParams(),
      ),
      stateBuilder: (status, {data, error}) =>
          state.copyWith(apiStatus: status, data: data, message: error),
    );
  }
}
