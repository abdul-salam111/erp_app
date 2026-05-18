import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../repositories/alert_panel_repository.dart';

class AlertPanelUsecase implements Usecase<dynamic, NoParams> {
  final AlertPanelRepository repository;

  AlertPanelUsecase({required this.repository});

  @override
  Future<Either<Failure, dynamic>> call(NoParams params) {
    return repository.performAction();
  }
}
