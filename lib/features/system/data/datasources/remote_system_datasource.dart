import '../../../../core/constants/const_exports.dart';
import '../../../../core/shared/shared_exports.dart';
import '../models/response_models/get_users_list/user_list_item_model.dart';

abstract interface class IRemoteSystemDataSource {
  Future<List<UserListItemModel>> getUsersList();
}

class RemoteSystemDataSourceImpl extends BaseRemoteDatasource
    implements IRemoteSystemDataSource {
  RemoteSystemDataSourceImpl({required super.dioHelper});

  @override
  Future<List<UserListItemModel>> getUsersList() {
    return postList<UserListItemModel>(
      url: ApiEndPoints.security.usersList,
      body: const {},
      parser: (json) =>
          UserListItemModel.fromJson(json as Map<String, dynamic>),
    );
  }
}
