import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../entities/monthly_stats_detail_entity.dart';
import '../repositories/dashboard_repository.dart';

class MonthlyStatsDetailParams extends Equatable {
  final String date;
  final String panelKey;
  const MonthlyStatsDetailParams({required this.date, required this.panelKey});

  @override
  List<Object> get props => [date, panelKey];
}

class GetMonthlyStatsDetailUsecase
    implements Usecase<List<MonthlyStatDetailPoint>, MonthlyStatsDetailParams> {
  final DashboardRepository repository;
  GetMonthlyStatsDetailUsecase({required this.repository});

  @override
  Future<Either<Failure, List<MonthlyStatDetailPoint>>> call(
    MonthlyStatsDetailParams params,
  ) {
    return repository.getMonthlyStatsDetail(
      date:     params.date,
      panelKey: params.panelKey,
    );
  }
}
