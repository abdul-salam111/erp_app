import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../domain/repositories/alert_panel_repository.dart';
import '../datasources/remote_alert_panel_datasource.dart';

class AlertPanelRepositoryImpl extends BaseRepository
    implements AlertPanelRepository {
  final IRemoteAlertPanelDataSource dataSource;

  AlertPanelRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, dynamic>> performAction() {
    return execute(
      call: () => dataSource.performAction(),
    );
  }
}
