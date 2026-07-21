import '../../../../core/shared/shared_exports.dart';
import '../../../../core/utils/result.dart';
import '../entities/party_option.dart';
import '../repositories/purchase_order_repository.dart';

class GetPartiesUsecase implements Usecase<List<PartyOption>, NoParams> {
  final PurchaseOrderRepository repository;

  GetPartiesUsecase({required this.repository});

  @override
  Future<Result<List<PartyOption>>> call(NoParams params) {
    return repository.fetchParties();
  }
}
