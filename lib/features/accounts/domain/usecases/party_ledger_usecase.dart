import 'package:fpdart/fpdart.dart';

import '../../../../core/networks/network_exports.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../accounts_exports.dart';

class PartyLedgerUsecase implements Usecase<dynamic, NoParams> {
  final AccountsRepository repository;

  PartyLedgerUsecase({required this.repository});

  @override
  Future<Either<Failure, dynamic>> call(NoParams params) {
    return repository.partyLedger();
  }
}
