import 'package:fpdart/fpdart.dart';
import '../../../networks/exceptions/app_exceptions.dart';

abstract interface class Usecase<SuccessType, Params> {
  Future<Either<AppException, SuccessType>> call(Params params);
}

class NoParams {}
