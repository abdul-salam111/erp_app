import '../../../../../core/shared/shared_exports.dart';
import '../../../../../core/utils/result.dart';
import '../../entities/credit_managment/customer_receivable_aging_entity.dart';
import '../../repositories/i_accounts_repository.dart';

class GetCustomerReceivableAgingParams {
  final String toDate;
  final int? partyId;

  const GetCustomerReceivableAgingParams({
    required this.toDate,
    this.partyId,
  });
}

class GetCustomerReceivableAgingUsecase
    implements
        Usecase<CustomerReceivableAgingEntity,
            GetCustomerReceivableAgingParams> {
  final IAccountsRepository repository;

  GetCustomerReceivableAgingUsecase({required this.repository});

  @override
  Future<Result<CustomerReceivableAgingEntity>> call(
    GetCustomerReceivableAgingParams params,
  ) =>
      repository.getCustomerReceivableAging(
        toDate: params.toDate,
        partyId: params.partyId,
      );
}
