import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../data/models/response_models/sale_order_detail/sale_order_detail.dart';
import '../repositories/sale_order_repository.dart';

class GetSaleOrderByIdUsecase implements Usecase<SaleOrderDetail, int> {
  final SaleOrderRepository repository;

  GetSaleOrderByIdUsecase({required this.repository});

  @override
  Future<Either<Failure, SaleOrderDetail>> call(int params) {
    return repository.fetchOrderById(params);
  }
}
