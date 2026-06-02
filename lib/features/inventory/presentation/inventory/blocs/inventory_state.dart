import 'package:equatable/equatable.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../domain/entities/current_stock_entity.dart';
import '../../../domain/entities/stock_received_entity.dart';

class InventoryState extends Equatable {
  final List<StockReceivedEntity> stockReceived;
  final ApiStatus stockReceivedStatus;
  final String? stockReceivedError;

  final List<CurrentStockEntity> currentStock;
  final ApiStatus currentStockStatus;
  final String? currentStockError;

  const InventoryState({
    this.stockReceived = const [],
    this.stockReceivedStatus = ApiStatus.INITIAL,
    this.stockReceivedError,
    this.currentStock = const [],
    this.currentStockStatus = ApiStatus.INITIAL,
    this.currentStockError,
  });

  InventoryState copyWith({
    List<StockReceivedEntity>? stockReceived,
    ApiStatus? stockReceivedStatus,
    String? stockReceivedError,
    List<CurrentStockEntity>? currentStock,
    ApiStatus? currentStockStatus,
    String? currentStockError,
  }) {
    return InventoryState(
      stockReceived: stockReceived ?? this.stockReceived,
      stockReceivedStatus: stockReceivedStatus ?? this.stockReceivedStatus,
      stockReceivedError: stockReceivedError ?? this.stockReceivedError,
      currentStock: currentStock ?? this.currentStock,
      currentStockStatus: currentStockStatus ?? this.currentStockStatus,
      currentStockError: currentStockError ?? this.currentStockError,
    );
  }

  @override
  List<Object?> get props => [
        stockReceived,
        stockReceivedStatus,
        stockReceivedError,
        currentStock,
        currentStockStatus,
        currentStockError,
      ];
}
