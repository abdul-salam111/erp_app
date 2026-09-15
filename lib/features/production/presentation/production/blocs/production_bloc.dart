import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../domain/entities/production_entity.dart';
import '../../../domain/usecases/production_usecase.dart';
import 'production_event.dart';
import 'production_state.dart';

class ProductionBloc extends Bloc<ProductionEvent, ProductionState>
    with UsecaseExecuterMixin {
  final ProductionUsecase productionUsecase;

  ProductionBloc({required this.productionUsecase})
      : super(const ProductionState()) {
    on<ProductionFetched>(_onFetched, transformer: droppable());
    on<ProductionSearchChanged>(_onSearchChanged, transformer: restartable());
    on<ProductionLoadMore>(_onLoadMore, transformer: sequential());
    on<ProductionSubmitted>(_onProductionSubmitted, transformer: droppable());
  }

  Future<void> _onFetched(
    ProductionFetched event,
    Emitter<ProductionState> emit,
  ) async {
    emit(state.copyWith(apiStatus: ApiStatus.LOADING));
    await Future<void>.delayed(const Duration(milliseconds: 300));
    emit(
      state.copyWith(
        apiStatus: ApiStatus.SUCCESS,
        orders: _sampleOrders,
        currentPage: 1,
      ),
    );
  }

  void _onSearchChanged(
    ProductionSearchChanged event,
    Emitter<ProductionState> emit,
  ) {
    emit(state.copyWith(searchQuery: event.query, currentPage: 1));
  }

  void _onLoadMore(
    ProductionLoadMore event,
    Emitter<ProductionState> emit,
  ) {
    if (!state.hasMore) return;
    emit(state.copyWith(currentPage: state.currentPage + 1));
  }

  Future<void> _onProductionSubmitted(
    ProductionSubmitted event,
    Emitter<ProductionState> emit,
  ) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => productionUsecase.call(NoParams()),
      stateBuilder: (status, {data, error}) =>
          state.copyWith(apiStatus: status, message: error),
    );
  }
}

// Sample data used until the real endpoint is wired up.
const _sampleOrders = <ProductionEntity>[
  ProductionEntity(
    id: 96,
    docNumber: 'PROD-0096',
    date: '14/09/26',
    consumptionDoc: 'BOM-0094',
    consumptionDate: '14/09/26',
    plant: 'Maize Plant',
    process: 'Maize Milling',
    shift: 'Morning',
    remarks: '14/09/2026 PRODUCTION POSTED',
    itemName: 'Atta # 2 ( Local )',
  ),
  ProductionEntity(
    id: 95,
    docNumber: 'PROD-0095',
    date: '13/09/26',
    consumptionDoc: 'BOM-0093',
    consumptionDate: '13/09/26',
    plant: 'Maize Plant',
    process: 'Maize Milling',
    shift: 'Morning',
    remarks: '13/09/2026 PRODUCTION POSTED',
    itemName: 'Corn Meal Medium',
  ),
  ProductionEntity(
    id: 94,
    docNumber: 'PROD-0094',
    date: '12/09/26',
    consumptionDoc: 'BOM-0092',
    consumptionDate: '12/09/26',
    plant: 'Maize Plant',
    process: 'Maize Milling',
    shift: 'Night',
    remarks: '12/09/2026 NIGHT SHIFT PRODUCTION POSTED',
    itemName: 'Corn Meal Medium',
  ),
  ProductionEntity(
    id: 93,
    docNumber: 'PROD-0093',
    date: '12/09/26',
    consumptionDoc: 'BOM-0091',
    consumptionDate: '12/09/26',
    plant: 'Maize Plant',
    process: 'Maize Milling',
    shift: 'Morning',
    remarks: '12/09/2026 day shift production posted',
    itemName: 'Corn Meal Medium',
  ),
  ProductionEntity(
    id: 92,
    docNumber: 'PROD-0092',
    date: '11/09/26',
    consumptionDoc: 'BOM-0090',
    consumptionDate: '11/09/26',
    plant: 'Maize Plant',
    process: 'Maize Milling',
    shift: 'Morning',
    remarks: '11/09/2026 production posted',
    itemName: 'Corn Grits B-45',
  ),
  ProductionEntity(
    id: 91,
    docNumber: 'PROD-0091',
    date: '10/09/26',
    plant: 'Rice Plant',
    process: 'Rice Processing',
    shift: 'Morning',
    itemName: '1121 Pk Sella Basmati',
  ),
  ProductionEntity(
    id: 90,
    docNumber: 'PROD-0090',
    date: '10/09/26',
    consumptionDoc: 'BOM-0089',
    consumptionDate: '10/09/26',
    plant: 'Maize Plant',
    process: 'Maize Milling',
    shift: 'Morning',
    remarks: '10-09-2026 production posted',
    itemName: 'Corn Meal Medium',
  ),
  ProductionEntity(
    id: 89,
    docNumber: 'PROD-0089',
    date: '10/09/26',
    consumptionDoc: 'BOM-0088',
    consumptionDate: '10/09/26',
    plant: 'Rice Plant',
    process: 'Chaki Milling',
    shift: 'Morning',
    remarks: 'RICE FLOUR PRODUCTION POSTED',
    itemName: 'Rice Flour',
  ),
  ProductionEntity(
    id: 88,
    docNumber: 'PROD-0088',
    date: '09/09/26',
    consumptionDoc: 'BOM-0087',
    consumptionDate: '09/09/26',
    plant: 'Maize Plant',
    process: 'Maize Milling',
    shift: 'Morning',
    remarks: '9/09/2026 production posted',
    itemName: 'Atta # 3 Mixture',
  ),
  ProductionEntity(
    id: 87,
    docNumber: 'PROD-0087',
    date: '08/09/26',
    consumptionDoc: 'BOM-0084',
    consumptionDate: '08/09/26',
    plant: 'Maize Plant',
    process: 'Maize Milling',
    shift: 'Morning',
    remarks: '8/09/2026 PRODUCTION POSTED',
    itemName: 'Corn Meal Medium',
  ),
];
