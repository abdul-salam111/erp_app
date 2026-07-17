import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../entities/party_option.dart';
import '../repositories/sale_order_repository.dart';

class GetSalePartiesUsecase implements Usecase<List<PartyOption>, NoParams> {
  final SaleOrderRepository repository;

  GetSalePartiesUsecase({required this.repository});

  @override
  Future<Either<Failure, List<PartyOption>>> call(NoParams params) {
    return repository.fetchParties();
  }
}
