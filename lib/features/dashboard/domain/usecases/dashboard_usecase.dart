import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../repositories/dashboard_repository.dart';

class DashboardUsecase implements Usecase<dynamic, NoParams> {
  final DashboardRepository repository;

  DashboardUsecase({required this.repository});

  @override
  Future<Either<Failure, dynamic>> call(NoParams params) {
    return repository.performAction();
  }
}
