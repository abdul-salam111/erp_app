import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../entities/sale_order_entity.dart';
import '../repositories/sale_order_repository.dart';

class SaleOrderParams extends Equatable {
  final String fromDate;
  final String toDate;
  final String? search;

  const SaleOrderParams({
    required this.fromDate,
    required this.toDate,
    this.search,
  });

  @override
  List<Object?> get props => [fromDate, toDate, search];
}

class SaleOrderUsecase implements Usecase<List<SaleOrderEntity>, SaleOrderParams> {
  final SaleOrderRepository repository;

  SaleOrderUsecase({required this.repository});

  @override
  Future<Either<Failure, List<SaleOrderEntity>>> call(SaleOrderParams params) {
    return repository.fetchOrders(
      fromDate: params.fromDate,
      toDate: params.toDate,
      search: params.search,
    );
  }
}
