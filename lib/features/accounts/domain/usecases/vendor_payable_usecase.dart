import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/networks/network_exports.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../accounts_exports.dart';

class VendorPayableParams extends Equatable {
  final String fromDate;
  final String toDate;

  const VendorPayableParams({required this.fromDate, required this.toDate});

  @override
  List<Object?> get props => [fromDate, toDate];
}

class VendorPayableUsecase
    implements Usecase<List<CustomerReceivableItemEntity>, VendorPayableParams> {
  final IAccountsRepository repository;

  VendorPayableUsecase({required this.repository});

  @override
  Future<Either<Failure, List<CustomerReceivableItemEntity>>> call(
    VendorPayableParams params,
  ) {
    return repository.vendorPayable(
      fromDate: params.fromDate,
      toDate: params.toDate,
    );
  }
}
