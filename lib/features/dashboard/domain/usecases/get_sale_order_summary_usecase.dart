import 'package:equatable/equatable.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../../../core/utils/result.dart';
import '../entities/sale_order_summary_entity.dart';
import '../repositories/dashboard_repository.dart';

class SaleOrderSummaryParams extends Equatable {
  final String fromDate;
  final String toDate;

  const SaleOrderSummaryParams({required this.fromDate, required this.toDate});

  @override
  List<Object> get props => [fromDate, toDate];
}

class GetSaleOrderSummaryUsecase implements Usecase<SaleOrderSummaryEntity, SaleOrderSummaryParams> {
  final DashboardRepository repository;

  GetSaleOrderSummaryUsecase({required this.repository});

  @override
  Future<Result<SaleOrderSummaryEntity>> call(SaleOrderSummaryParams params) {
    return repository.getSaleOrderSummary(fromDate: params.fromDate, toDate: params.toDate);
  }
}
