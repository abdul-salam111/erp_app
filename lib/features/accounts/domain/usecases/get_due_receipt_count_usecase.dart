import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../data/models/response_models/get_due_receipt_count/due_receipt_count_model.dart';
import '../repositories/accounts_repository.dart';

class GetDueReceiptCountParams {
  final String dateType;
  const GetDueReceiptCountParams({required this.dateType});
}

class GetDueReceiptCountUsecase
    implements Usecase<DueReceiptCountModel, GetDueReceiptCountParams> {
  final AccountsRepository repository;

  GetDueReceiptCountUsecase({required this.repository});

  @override
  Future<Either<Failure, DueReceiptCountModel>> call(
    GetDueReceiptCountParams params,
  ) =>
      repository.getDueReceiptCount(dateType: params.dateType);
}
