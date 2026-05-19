import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../domain/usecases/production_usecase.dart';
import 'production_event.dart';
import 'production_state.dart';

class ProductionBloc extends Bloc<ProductionEvent, ProductionState>
    with UsecaseExecuterMixin {
  final ProductionUsecase productionUsecase;

  ProductionBloc({required this.productionUsecase})
      : super(const ProductionState()) {
    on<ProductionSubmitted>(_onProductionSubmitted);
  }

  Future<void> _onProductionSubmitted(
    ProductionSubmitted event,
    Emitter<ProductionState> emit,
  ) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => productionUsecase.call(
        // TODO: Pass your parameters here
        NoParams(),
      ),
      stateBuilder: (status, {data, error}) =>
          state.copyWith(apiStatus: status, data: data, message: error),
    );
  }
}
