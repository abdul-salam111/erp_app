import '../../../../core/shared/shared_exports.dart';
import '../../../../core/constants/const_exports.dart';

abstract interface class IRemoteLoanAndAdvanceDataSource {
  // TODO: Define your datasource methods here
  Future<dynamic> performAction();
}

class RemoteLoanAndAdvanceDataSourceImpl extends BaseRemoteDatasource
    implements IRemoteLoanAndAdvanceDataSource {
  RemoteLoanAndAdvanceDataSourceImpl({required super.dioHelper});

  @override
  Future<dynamic> performAction() async {
    return post(
      url: ApiEndPoints.loanAndAdvance.getLoans,
      parser: (json) => json, // TODO: Replace with your model parser
      body: {}, // TODO: Add your request body
    );
  }
}
