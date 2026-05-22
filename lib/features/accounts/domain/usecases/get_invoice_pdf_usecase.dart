import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../repositories/accounts_repository.dart';

class GetInvoicePdfParams {
  final int featureId;
  final int parentEntityId;
  const GetInvoicePdfParams({
    required this.featureId,
    required this.parentEntityId,
  });
}

class GetInvoicePdfUsecase implements Usecase<String, GetInvoicePdfParams> {
  final AccountsRepository repository;

  GetInvoicePdfUsecase({required this.repository});

  @override
  Future<Either<Failure, String>> call(GetInvoicePdfParams params) =>
      repository.getInvoicePdf(
        featureId: params.featureId,
        parentEntityId: params.parentEntityId,
      );
}
