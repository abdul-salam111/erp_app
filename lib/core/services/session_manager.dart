import 'dart:convert';
import 'package:mantic_erp_app/features/auth/auth_exports.dart';
import '../constants/const_exports.dart';
import '../local_storage/storage.dart';

class SessionController {
  static final SessionController _session = SessionController._internal();
  SessionController._internal();

  static SessionController get instance => _session;
  factory SessionController() => _session;

  UserEntity? loggedInUser;
  UserOrganizationEntity? selectedOrganization;
  List<String> userFeatures = [];
  List<String> userRoles = [];
  bool islogin = false;
  bool isAdmin = false; 

  // Token returned by SelectBranch — takes priority over the branch pre-token.
  String? _sessionToken;

  /// Returns the SelectBranch token when available, falls back to the branch
  /// pre-token from the login response.
  String? get activeAccessToken =>
      _sessionToken ?? selectedOrganization?.activeAccessToken;

  Future<void> saveUserInStorage(UserEntity user) async {
    loggedInUser = user;
    islogin = true;
    await storage.setValues(StorageKeys.loggedIn, 'true');
    await storage.setValues(StorageKeys.userDetails, jsonEncode(user.toJson()));
  }

  Future<void> saveSelectedOrganization(UserOrganizationEntity org) async {
    selectedOrganization = org;
    await storage.setValues(
      StorageKeys.selectedOrganization,
      jsonEncode(org.toJson()),
    );
  }

  /// Persists the final session token returned by the SelectBranch API.
  Future<void> updateActiveToken(String token) async {
    _sessionToken = token;
    await storage.setValues(StorageKeys.token, token);
  }

  bool hasFeature(String featureKey) => userFeatures.contains(featureKey);

  Future<void> saveUserFeatures(List<String> features) async {
    userFeatures = features;
    await storage.setValues(StorageKeys.userFeatures, jsonEncode(features));
  }

  Future<void> saveUserRoles(List<String> roles) async {
    userRoles = roles;
    isAdmin = roles.any((r) => AppConstants.adminRoles.contains(r));
    await storage.setValues(StorageKeys.userRoles, jsonEncode(roles));
  }

  Future<void> getUserFromStorage() async {
    try {
      final userData = await storage.readValues(StorageKeys.userDetails);
      if (userData != null) {
        final decoded = jsonDecode(userData) as Map<String, dynamic>;
        loggedInUser = UserEntity.fromJson(decoded);
      }

      final orgData = await storage.readValues(StorageKeys.selectedOrganization);
      if (orgData != null) {
        selectedOrganization =
            UserOrganizationEntity.fromJson(jsonDecode(orgData));
      }

      final isLoggedIn = await storage.readValues(StorageKeys.loggedIn);
      islogin = isLoggedIn == 'true';

      final storedToken = await storage.readValues(StorageKeys.token);
      if (storedToken != null) _sessionToken = storedToken;

      final featuresJson = await storage.readValues(StorageKeys.userFeatures);
      if (featuresJson != null) {
        userFeatures = List<String>.from(jsonDecode(featuresJson) as List);
      }

      final rolesJson = await storage.readValues(StorageKeys.userRoles);
      if (rolesJson != null) {
        userRoles = List<String>.from(jsonDecode(rolesJson) as List);
        isAdmin = userRoles.any((r) => AppConstants.adminRoles.contains(r));
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> clearSession() async {
    loggedInUser = null;
    selectedOrganization = null;
    userFeatures = [];
    userRoles = [];
    _sessionToken = null;
    islogin = false;
    isAdmin = false;
    await storage.setValues(StorageKeys.loggedIn, 'false');
    await storage.clearValues(StorageKeys.userDetails);
    await storage.clearValues(StorageKeys.selectedOrganization);
    await storage.clearValues(StorageKeys.token);
    await storage.clearValues(StorageKeys.userFeatures);
    await storage.clearValues(StorageKeys.userRoles);
  }
}
