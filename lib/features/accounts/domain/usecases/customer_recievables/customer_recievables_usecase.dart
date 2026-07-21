import 'package:equatable/equatable.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../../../core/utils/result.dart';
import '../../../accounts_exports.dart';

class CustomerRecievablesParams extends Equatable {
  final String fromDate;
  final String toDate;

  const CustomerRecievablesParams({
    required this.fromDate,
    required this.toDate,
  });

  @override
  List<Object?> get props => [fromDate, toDate];
}

class CustomerRecievablesUsecase
    implements
        Usecase<List<CustomerReceivableItemEntity>, CustomerRecievablesParams> {
  final IAccountsRepository repository;

  CustomerRecievablesUsecase({required this.repository});

  @override
  Future<Result<List<CustomerReceivableItemEntity>>> call(
    CustomerRecievablesParams params,
  ) {
    return repository.getCustomerReceivables(
      fromDate: params.fromDate,
      toDate: params.toDate,
    );
  }
}
