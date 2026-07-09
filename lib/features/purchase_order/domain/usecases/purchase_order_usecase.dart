import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../entities/purchase_order_entity.dart';
import '../repositories/purchase_order_repository.dart';

class PurchaseOrderParams extends Equatable {
  final String fromDate;
  final String toDate;
  final String? search;

  const PurchaseOrderParams({
    required this.fromDate,
    required this.toDate,
    this.search,
  });

  @override
  List<Object?> get props => [fromDate, toDate, search];
}

class PurchaseOrderUsecase
    implements Usecase<List<PurchaseOrderEntity>, PurchaseOrderParams> {
  final PurchaseOrderRepository repository;

  PurchaseOrderUsecase({required this.repository});

  @override
  Future<Either<Failure, List<PurchaseOrderEntity>>> call(
      PurchaseOrderParams params) {
    return repository.fetchOrders(
      fromDate: params.fromDate,
      toDate: params.toDate,
      search: params.search,
    );
  }
}
