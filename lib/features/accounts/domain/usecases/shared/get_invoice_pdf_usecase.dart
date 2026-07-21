import '../../../../../core/shared/shared_exports.dart';
import '../../../../../core/utils/result.dart';
import '../../repositories/i_accounts_repository.dart';

class GetInvoicePdfParams {
  final int featureId;
  final int parentEntityId;
  const GetInvoicePdfParams({
    required this.featureId,
    required this.parentEntityId,
  });
}

class GetInvoicePdfUsecase implements Usecase<String, GetInvoicePdfParams> {
  final IAccountsRepository repository;

  GetInvoicePdfUsecase({required this.repository});

  @override
  Future<Result<String>> call(GetInvoicePdfParams params) =>
      repository.getInvoicePdf(
        featureId: params.featureId,
        parentEntityId: params.parentEntityId,
      );
}
