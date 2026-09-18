import 'package:equatable/equatable.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../../../core/utils/result.dart';
import '../entities/receipt_entity.dart';
import '../repositories/dashboard_repository.dart';

class TodayReceiptsParams extends Equatable {
  final String dateType;
  const TodayReceiptsParams({required this.dateType});

  @override
  List<Object> get props => [dateType];
}

class GetTodayReceiptsUsecase
    implements Usecase<List<ReceiptEntity>, TodayReceiptsParams> {
  final DashboardRepository repository;
  GetTodayReceiptsUsecase({required this.repository});

  @override
  Future<Result<List<ReceiptEntity>>> call(TodayReceiptsParams params) {
    return repository.getTodayReceipts(dateType: params.dateType);
  }
}
