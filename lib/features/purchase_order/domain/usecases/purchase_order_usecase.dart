import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../entities/purchase_order_entity.dart';
import '../repositories/purchase_order_repository.dart';

class PurchaseOrderParams extends Equatable {
  final String? search;

  const PurchaseOrderParams({this.search});

  @override
  List<Object?> get props => [search];
}

class PurchaseOrderUsecase
    implements Usecase<List<PurchaseOrderEntity>, PurchaseOrderParams> {
  final PurchaseOrderRepository repository;

  PurchaseOrderUsecase({required this.repository});

  @override
  Future<Either<Failure, List<PurchaseOrderEntity>>> call(
      PurchaseOrderParams params) {
    return repository.fetchOrders(search: params.search);
  }
}
