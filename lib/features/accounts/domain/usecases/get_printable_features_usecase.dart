import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../repositories/i_accounts_repository.dart';

class GetPrintableFeaturesUsecase implements Usecase<List<int>, NoParams> {
  final IAccountsRepository repository;

  GetPrintableFeaturesUsecase({required this.repository});

  @override
  Future<Either<Failure, List<int>>> call(NoParams params) =>
      repository.getPrintableFeatures();
}
