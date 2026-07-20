import 'package:fpdart/fpdart.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../domain/repositories/security_repository.dart';
import '../datasources/remote_security_datasource.dart';

class SecurityRepositoryImpl extends BaseRepository
    implements SecurityRepository {
  final IRemoteSecurityDataSource dataSource;

  SecurityRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, dynamic>> performAction() {
    return execute(
      call: () => dataSource.performAction(),
    );
  }
}
