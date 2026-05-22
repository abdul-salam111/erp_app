import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../entities/monthly_stats_entity.dart';
import '../repositories/dashboard_repository.dart';

class GetMonthlyStatsUsecase implements Usecase<MonthlyStatsEntity, NoParams> {
  final DashboardRepository repository;

  GetMonthlyStatsUsecase({required this.repository});

  @override
  Future<Either<Failure, MonthlyStatsEntity>> call(NoParams params) {
    return repository.getMonthlyStats();
  }
}
