import '../../../../core/shared/shared_exports.dart';
import '../../../../core/utils/result.dart';
import '../repositories/analytics_repository.dart';

class AnalyticsUsecase implements Usecase<dynamic, NoParams> {
  final AnalyticsRepository repository;

  AnalyticsUsecase({required this.repository});

  @override
  Future<Result<dynamic>> call(NoParams params) {
    return repository.performAction();
  }
}
