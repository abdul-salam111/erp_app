import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../entities/daily_stats_entity.dart';
import '../repositories/dashboard_repository.dart';

class DailyStatsParams {
  final String date; // format: "yyyy-MM-dd"
  const DailyStatsParams({required this.date});
}

class GetDailyStatsUsecase implements Usecase<DailyStatsEntity, DailyStatsParams> {
  final DashboardRepository repository;

  GetDailyStatsUsecase({required this.repository});

  @override
  Future<Either<Failure, DailyStatsEntity>> call(DailyStatsParams params) {
    return repository.getDailyStats(date: params.date);
  }
}
