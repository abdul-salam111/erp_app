import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../domain/repositories/accounts_repository.dart';
import '../datasources/remote_accounts_datasource.dart';

class AccountsRepositoryImpl extends BaseRepository
    implements AccountsRepository {
  final IRemoteAccountsDataSource dataSource;

  AccountsRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, dynamic>> performAction() {
    return execute(
      call: () => dataSource.performAction(),
    );
  }
}
