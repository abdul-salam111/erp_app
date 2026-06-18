import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../entities/due_receipt_count_entity.dart';
import '../repositories/i_accounts_repository.dart';

class GetDueReceiptCountParams {
  final String dateType;
  const GetDueReceiptCountParams({required this.dateType});
}

class GetDueReceiptCountUsecase
    implements Usecase<DueReceiptCountEntity, GetDueReceiptCountParams> {
  final IAccountsRepository repository;

  GetDueReceiptCountUsecase({required this.repository});

  @override
  Future<Either<Failure, DueReceiptCountEntity>> call(
    GetDueReceiptCountParams params,
  ) =>
      repository.getDueReceiptCount(dateType: params.dateType);
}
