import 'package:fpdart/fpdart.dart';
import 'package:mantic_erp_app/core/networks/exceptions/app_exceptions.dart';


abstract interface class AlertPanelRepository {
  // TODO: Define your repository methods here
  Future<Either<AppException, dynamic>> performAction();
}
