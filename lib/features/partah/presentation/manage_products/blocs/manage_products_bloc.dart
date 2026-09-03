import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../domain/usecases/get_active_product_templates_usecase.dart';
import '../../../domain/usecases/save_product_templates_usecase.dart';
import 'manage_products_event.dart';
import 'manage_products_state.dart';

class ManageProductsBloc extends Bloc<ManageProductsEvent, ManageProductsState>
    with UsecaseExecuterMixin {
  final GetActiveProductTemplatesUsecase getActiveProductTemplates;
  final SaveProductTemplatesUsecase saveProductTemplates;

  ManageProductsBloc({
    required this.getActiveProductTemplates,
    required this.saveProductTemplates,
  }) : super(const ManageProductsState()) {
    on<ManageProductsStarted>(_onStarted, transformer: droppable());
    on<ManageProductsSaveRequested>(_onSaveRequested, transformer: droppable());
  }

  Future<void> _onStarted(ManageProductsStarted event, Emitter<ManageProductsState> emit) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => getActiveProductTemplates(NoParams()),
      stateBuilder: (status, {data, error}) => state.copyWith(
        loadStatus: status,
        templates: data,
        errorMessage: error,
      ),
    );
  }

  Future<void> _onSaveRequested(
    ManageProductsSaveRequested event,
    Emitter<ManageProductsState> emit,
  ) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => saveProductTemplates(event.templates),
      stateBuilder: (status, {data, error}) => state.copyWith(
        saveStatus: status,
        errorMessage: error,
      ),
    );
  }
}
