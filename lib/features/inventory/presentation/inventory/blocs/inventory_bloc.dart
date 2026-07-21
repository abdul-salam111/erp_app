import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_current_stock_usecase.dart';
import '../../../domain/usecases/get_stock_received_usecase.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/shared/shared_exports.dart';
import 'inventory_event.dart';
import 'inventory_state.dart';

class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {
  final GetStockReceivedUsecase _getStockReceived;
  final GetCurrentStockUsecase _getCurrentStock;

  InventoryBloc({
    required GetStockReceivedUsecase getStockReceived,
    required GetCurrentStockUsecase getCurrentStock,
  })  : _getStockReceived = getStockReceived,
        _getCurrentStock = getCurrentStock,
        super(const InventoryState()) {
    on<FetchInventoryData>(_onFetchInventoryData);
    on<StockReceivedDateTypeChanged>(_onStockReceivedDateTypeChanged);
  }

  Future<void> _onFetchInventoryData(
    FetchInventoryData event,
    Emitter<InventoryState> emit,
  ) async {
    emit(state.copyWith(
      stockReceivedStatus: ApiStatus.LOADING,
      currentStockStatus: ApiStatus.LOADING,
    ));

    final (stockResult, currentResult) = await (
      _getStockReceived(const StockReceivedParams()),
      _getCurrentStock(NoParams()),
    ).wait;

    stockResult.when(
      failure: (f) => emit(state.copyWith(
        stockReceivedStatus: ApiStatus.FAILURE,
        stockReceivedError: f.message,
      )),
      success: (data) => emit(state.copyWith(
        stockReceivedStatus: ApiStatus.SUCCESS,
        stockReceived: data,
      )),
    );

    currentResult.when(
      failure: (f) => emit(state.copyWith(
        currentStockStatus: ApiStatus.FAILURE,
        currentStockError: f.message,
      )),
      success: (data) => emit(state.copyWith(
        currentStockStatus: ApiStatus.SUCCESS,
        currentStock: data,
      )),
    );
  }

  Future<void> _onStockReceivedDateTypeChanged(
    StockReceivedDateTypeChanged event,
    Emitter<InventoryState> emit,
  ) async {
    emit(state.copyWith(stockReceivedStatus: ApiStatus.LOADING));

    final result = await _getStockReceived(
      StockReceivedParams(dateType: event.dateType),
    );

    result.when(
      failure: (f) => emit(state.copyWith(
        stockReceivedStatus: ApiStatus.FAILURE,
        stockReceivedError: f.message,
      )),
      success: (data) => emit(state.copyWith(
        stockReceivedStatus: ApiStatus.SUCCESS,
        stockReceived: data,
      )),
    );
  }
}
