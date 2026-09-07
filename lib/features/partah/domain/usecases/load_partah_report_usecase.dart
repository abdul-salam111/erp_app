import '../../../../core/utils/result.dart';
import '../../../../core/shared/shared_exports.dart';
import '../entities/partah_report_entity.dart';
import '../repositories/partah_repository.dart';

class LoadPartahReportParams {
  final String fromDate;
  final String toDate;

  const LoadPartahReportParams({required this.fromDate, required this.toDate});
}

class LoadPartahReportUsecase implements Usecase<PartahReportEntity, LoadPartahReportParams> {
  final PartahRepository repository;

  LoadPartahReportUsecase({required this.repository});

  @override
  Future<Result<PartahReportEntity>> call(LoadPartahReportParams params) {
    return repository.loadReport(fromDate: params.fromDate, toDate: params.toDate);
  }
}
