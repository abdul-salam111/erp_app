import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../entities/party_option.dart';
import '../repositories/purchase_order_repository.dart';

class GetPartiesUsecase implements Usecase<List<PartyOption>, NoParams> {
  final PurchaseOrderRepository repository;

  GetPartiesUsecase({required this.repository});

  @override
  Future<Either<Failure, List<PartyOption>>> call(NoParams params) {
    return repository.fetchParties();
  }
}
