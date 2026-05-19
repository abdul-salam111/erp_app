import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../repositories/analytics_repository.dart';

class AnalyticsUsecase implements Usecase<dynamic, NoParams> {
  final AnalyticsRepository repository;

  AnalyticsUsecase({required this.repository});

  @override
  Future<Either<Failure, dynamic>> call(NoParams params) {
    return repository.performAction();
  }
}
