import 'package:fpdart/fpdart.dart';

import '../../../../core/networks/network_exports.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../accounts_exports.dart';

class VendorPayableUsecase
    implements Usecase<List<CustomerReceivableItemEntity>, NoParams> {
  final IAccountsRepository repository;

  VendorPayableUsecase({required this.repository});

  @override
  Future<Either<Failure, List<CustomerReceivableItemEntity>>> call(
    NoParams params,
  ) {
    return repository.vendorPayable();
  }
}
