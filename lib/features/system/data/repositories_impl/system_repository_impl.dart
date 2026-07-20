import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../domain/repositories/system_repository.dart';
import '../datasources/remote_system_datasource.dart';

class SystemRepositoryImpl extends BaseRepository
    implements SystemRepository {
  final IRemoteSystemDataSource dataSource;

  SystemRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, dynamic>> performAction() {
    return execute(
      call: () => dataSource.performAction(),
    );
  }
}
