import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../entities/daily_stats_entity.dart';
import '../repositories/dashboard_repository.dart';

class GetDailyStatsUsecase implements Usecase<DailyStatsEntity, NoParams> {
  final DashboardRepository repository;

  GetDailyStatsUsecase({required this.repository});

  @override
  Future<Either<Failure, DailyStatsEntity>> call(NoParams params) {
    return repository.getDailyStats();
  }
}
