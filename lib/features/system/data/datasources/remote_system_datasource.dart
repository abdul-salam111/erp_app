import '../../../../core/constants/const_exports.dart';
import '../../../../core/services/session_manager.dart';
import '../../../../core/shared/shared_exports.dart';
import '../models/response_models/get_branches/branch_model.dart';
import '../models/response_models/get_landing_page_features/landing_page_feature_model.dart';
import '../models/response_models/get_roles/role_model.dart';
import '../models/response_models/get_user_by_id/user_detail_model.dart';
import '../models/response_models/get_users_list/user_list_item_model.dart';

abstract interface class IRemoteSystemDataSource {
  Future<List<UserListItemModel>> getUsersList();
  Future<UserDetailModel> getUserById(int id);
  Future<List<LandingPageFeatureModel>> getLandingPageFeatures();
  Future<List<BranchModel>> getBranchList({required int tenantId});
  Future<List<RoleModel>> getRoleList({int? organizationId});
  Future<RoleModel> getRoleById(int id);
  Future<RoleModel> saveRole(Map<String, dynamic> payload);
  Future<UserDetailModel> saveUser(Map<String, dynamic> payload);
  Future<bool> deleteUser(int id);
}

class RemoteSystemDataSourceImpl extends BaseRemoteDatasource
    implements IRemoteSystemDataSource {
  RemoteSystemDataSourceImpl({required super.dioHelper});

  String? get _token => SessionController.instance.activeAccessToken;

  @override
  Future<List<UserListItemModel>> getUsersList() {
    return postList<UserListItemModel>(
      url: ApiEndPoints.security.usersList,
      body: const {},
      authToken: _token,
      parser: (json) =>
          UserListItemModel.fromJson(json as Map<String, dynamic>),
    );
  }

  @override
  Future<UserDetailModel> getUserById(int id) {
    return get<UserDetailModel>(
      url: ApiEndPoints.security.userById(id),
      authToken: _token,
      parser: (json) => UserDetailModel.fromJson(json as Map<String, dynamic>),
    );
  }

  @override
  Future<List<LandingPageFeatureModel>> getLandingPageFeatures() {
    return getList<LandingPageFeatureModel>(
      url: ApiEndPoints.backOffice.landingPageFeatures,
      authToken: _token,
      parser: (json) =>
          LandingPageFeatureModel.fromJson(json as Map<String, dynamic>),
    );
  }

  @override
  Future<List<BranchModel>> getBranchList({required int tenantId}) {
    return postList<BranchModel>(
      url: ApiEndPoints.backOffice.branchList,
      body: {'MisTenantId': tenantId},
      authToken: _token,
      parser: (json) => BranchModel.fromJson(json as Map<String, dynamic>),
    );
  }

  @override
  Future<List<RoleModel>> getRoleList({int? organizationId}) {
    return postList<RoleModel>(
      url: ApiEndPoints.backOffice.roleList,
      body: organizationId == null ? const {} : {'MisOrganizationId': organizationId},
      authToken: _token,
      parser: (json) => RoleModel.fromJson(json as Map<String, dynamic>),
    );
  }

  @override
  Future<RoleModel> getRoleById(int id) {
    return get<RoleModel>(
      url: ApiEndPoints.backOffice.roleById(id),
      authToken: _token,
      parser: (json) => RoleModel.fromJson(json as Map<String, dynamic>),
    );
  }

  @override
  Future<RoleModel> saveRole(Map<String, dynamic> payload) {
    return post<RoleModel>(
      url: ApiEndPoints.backOffice.roleInsertOrUpdate,
      body: payload,
      authToken: _token,
      parser: (json) => RoleModel.fromJson(json as Map<String, dynamic>),
    );
  }

  @override
  Future<UserDetailModel> saveUser(Map<String, dynamic> payload) {
    return post<UserDetailModel>(
      url: ApiEndPoints.security.userInsertOrUpdate,
      body: payload,
      authToken: _token,
      parser: (json) => UserDetailModel.fromJson(json as Map<String, dynamic>),
    );
  }

  @override
  Future<bool> deleteUser(int id) {
    return delete<bool>(
      url: ApiEndPoints.security.userDelete(id),
      authToken: _token,
      parser: (json) => json == true,
    );
  }
}
