import 'package:fpdart/fpdart.dart';
import 'package:mantic_erp_app/core/networks/exceptions/app_exceptions.dart';

import '../../../../core/shared/shared_exports.dart';
import '../repositories/alert_panel_repository.dart';

class AlertPanelUsecase implements Usecase<dynamic, NoParams> {
  final AlertPanelRepository repository;

  AlertPanelUsecase({required this.repository});

  @override
  Future<Either<AppException, dynamic>> call(NoParams params) {
    return repository.performAction();
  }
}
