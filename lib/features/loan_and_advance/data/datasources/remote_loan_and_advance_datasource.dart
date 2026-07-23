import '../../../../core/shared/shared_exports.dart';
import '../../../../core/constants/const_exports.dart';

abstract interface class IRemoteLoanAndAdvanceDataSource {
  Future<dynamic> performAction();
  Future<dynamic> applyLoan(Map<String, dynamic> body);
}

class RemoteLoanAndAdvanceDataSourceImpl extends BaseRemoteDatasource
    implements IRemoteLoanAndAdvanceDataSource {
  RemoteLoanAndAdvanceDataSourceImpl({required super.dioHelper});

  @override
  Future<dynamic> performAction() async {
    return post(
      url: ApiEndPoints.loanAndAdvance.getLoans,
      parser: (json) => json,
      body: {},
    );
  }

  @override
  Future<dynamic> applyLoan(Map<String, dynamic> body) async {
    return post(
      url: ApiEndPoints.loanAndAdvance.applyLoan,
      parser: (json) => json,
      body: body,
    );
  }
}
