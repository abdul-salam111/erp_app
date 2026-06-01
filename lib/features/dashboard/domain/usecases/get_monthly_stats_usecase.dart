import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../entities/monthly_stats_entity.dart';
import '../repositories/dashboard_repository.dart';

class MonthlyStatsParams extends Equatable {
  final String date;
  const MonthlyStatsParams({required this.date});

  @override
  List<Object> get props => [date];
}

class GetMonthlyStatsUsecase implements Usecase<MonthlyStatsEntity, MonthlyStatsParams> {
  final DashboardRepository repository;
  GetMonthlyStatsUsecase({required this.repository});

  @override
  Future<Either<Failure, MonthlyStatsEntity>> call(MonthlyStatsParams params) {
    return repository.getMonthlyStats(date: params.date);
  }
}
