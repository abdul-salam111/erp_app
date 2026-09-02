import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/utils/result.dart';
import '../../../domain/entities/cost_item_entity.dart';
import '../../../domain/entities/production_entry_entity.dart';
import '../../../domain/usecases/get_last_costs_usecase.dart';
import '../../../domain/usecases/get_last_production_entries_usecase.dart';
import '../../../domain/usecases/get_product_templates_usecase.dart';
import '../../../domain/usecases/save_partah_record_usecase.dart';
import 'partah_event.dart';
import 'partah_state.dart';

class PartahBloc extends Bloc<PartahEvent, PartahState> with UsecaseExecuterMixin {
  final GetProductTemplatesUsecase getProductTemplates;
  final GetLastCostsUsecase getLastCosts;
  final GetLastProductionEntriesUsecase getLastProductionEntries;
  final SavePartahRecordUsecase saveRecord;

  PartahBloc({
    required this.getProductTemplates,
    required this.getLastCosts,
    required this.getLastProductionEntries,
    required this.saveRecord,
  }) : super(const PartahState()) {
    on<PartahStarted>(_onStarted);
    on<PartahRecordSaveRequested>(_onSaveRequested);
  }

  Future<void> _onStarted(PartahStarted event, Emitter<PartahState> emit) async {
    emit(state.copyWith(loadStatus: ApiStatus.LOADING));

    // Kick off all three calls concurrently, await individually so each
    // result keeps its own concrete type (Future.wait would widen them to Object).
    final templatesFuture = getProductTemplates(NoParams());
    final costsFuture = getLastCosts(NoParams());
    final entriesFuture = getLastProductionEntries(NoParams());

    final templatesResult = await templatesFuture;
    final costsResult = await costsFuture;
    final entriesResult = await entriesFuture;

    // Product templates are required for the calculator to render.
    if (templatesResult case ResultError(:final failure)) {
      emit(state.copyWith(loadStatus: ApiStatus.FAILURE, errorMessage: failure.message));
      return;
    }

    final templates = (templatesResult as Success<List<ProductTemplateEntity>>).data;
    final (variableCosts, fixedCosts) = costsResult is Success<(List<CostItemEntity>, List<CostItemEntity>)>
        ? costsResult.data
        : (const <CostItemEntity>[], const <CostItemEntity>[]);
    final entries = entriesResult is Success<List<ProductionEntryEntity>>
        ? entriesResult.data
        : const <ProductionEntryEntity>[];

    emit(state.copyWith(
      loadStatus: ApiStatus.SUCCESS,
      productTemplates: templates,
      lastVariableCosts: variableCosts,
      lastFixedCosts: fixedCosts,
      lastProductionEntries: entries,
    ));
  }

  Future<void> _onSaveRequested(
    PartahRecordSaveRequested event,
    Emitter<PartahState> emit,
  ) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => saveRecord(event.record),
      stateBuilder: (status, {data, error}) => state.copyWith(
        saveStatus: status,
        savedRecordId: data,
        errorMessage: error,
      ),
    );
  }
}
