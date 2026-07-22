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

  Future<void> getUserFromStorage() async {
    try {
      final userData = await storage.readValues(StorageKeys.userDetails);
      if (userData != null) {
        loggedInUser = UserEntity.fromJson(jsonDecode(userData));
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
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> clearSession() async {
    loggedInUser = null;
    selectedOrganization = null;
    _sessionToken = null;
    islogin = false;
    isAdmin = false;
    await storage.setValues(StorageKeys.loggedIn, 'false');
    await storage.clearValues(StorageKeys.userDetails);
    await storage.clearValues(StorageKeys.selectedOrganization);
    await storage.clearValues(StorageKeys.token);
  }
}
