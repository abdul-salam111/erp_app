import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../entities/sale_order_summary_entity.dart';
import '../repositories/dashboard_repository.dart';

class GetSaleOrderSummaryUsecase implements Usecase<SaleOrderSummaryEntity, NoParams> {
  final DashboardRepository repository;

  GetSaleOrderSummaryUsecase({required this.repository});

  @override
  Future<Either<Failure, SaleOrderSummaryEntity>> call(NoParams params) {
    return repository.getSaleOrderSummary();
  }
}
