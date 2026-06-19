import 'package:fpdart/fpdart.dart';
import '../../inventory_exports.dart';

class InventoryRepositoryImpl extends BaseRepository
    implements InventoryRepository {
  final IRemoteInventoryDataSource dataSource;

  InventoryRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<StockReceivedEntity>>> getStockReceived(
    String dateType,
  ) async {
    final result = await execute(
      call: () => dataSource.getStockReceived(dateType),
    );
    return result.map((models) => models.map(_toStockReceivedEntity).toList());
  }

  @override
  Future<Either<Failure, List<CurrentStockEntity>>> getCurrentStock() async {
    final result = await execute(call: () => dataSource.getCurrentStock());
    return result.map((models) => models.map(_toCurrentStockEntity).toList());
  }

  static StockReceivedEntity _toStockReceivedEntity(StockRecievedModel m) {
    return StockReceivedEntity(
      partyId: m.partyId ?? 0,
      partyName: m.party?.fullName ?? '',
      locationName: m.party?.locationName ?? '',
      partyTypeName: m.party?.partyTypeName ?? '',
      itemId: m.itemId ?? 0,
      itemName: m.item?.name,
      itemCount: m.itemCount,
      qty: m.qty ?? 0,
      weight: m.weight ?? 0,
    );
  }

  static CurrentStockEntity _toCurrentStockEntity(CurrentStockModel m) {
    return CurrentStockEntity(
      itemId: m.itemId ?? 0,
      itemName: m.item?.name ?? '',
      invAmountBasedOn: m.item?.invAmountBasedOn ?? '',
      currentQty: m.currentQty ?? 0,
      currentWeight: m.currentWeight ?? 0,
      upcommingQty: m.upcommingQty ?? 0,
      upcommingWeight: m.upcommingWeight ?? 0,
      totalQty: m.totalQty ?? 0,
      totalWeight: m.totalWeight ?? 0,
    );
  }
}
