import '../../../../core/shared/shared_exports.dart';
import '../../../../core/utils/result.dart';
import '../entities/party_option.dart';
import '../repositories/sale_order_repository.dart';

class GetSalePartiesUsecase implements Usecase<List<PartyOption>, NoParams> {
  final SaleOrderRepository repository;

  GetSalePartiesUsecase({required this.repository});

  @override
  Future<Result<List<PartyOption>>> call(NoParams params) {
    return repository.fetchParties();
  }
}
