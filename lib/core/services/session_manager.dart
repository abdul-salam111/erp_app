import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:mantic_erp_app/features/auth/auth_exports.dart';
import '../constants/const_exports.dart';
import '../local_storage/storage.dart';

class SessionController {
  static final SessionController _session = SessionController._internal();
  SessionController._internal();

  static SessionController get instance => _session;
  factory SessionController() => _session;

  /// How long before the token's actual expiry we proactively refresh it.
  static const _refreshBuffer = Duration(minutes: 2);

  UserEntity? loggedInUser;
  UserOrganizationEntity? selectedOrganization;
  List<String> userFeatures = [];
  List<String> userRoles = [];
  bool islogin = false;
  bool isAdmin = false;

  // Credentials kept for silent token refresh — there is no dedicated
  // refresh endpoint, so refreshing means re-running the login flow.
  String? savedEmail;
  String? savedPassword;

  /// Invoked when a silent refresh finds the previously selected
  /// organization/branch is no longer available — wired by the app shell to
  /// route the user to the organization-selection screen.
  VoidCallback? onOrganizationUnavailable;

  // Token returned by SelectBranch — takes priority over the branch pre-token.
  String? _sessionToken;

  /// Returns the SelectBranch token when available, falls back to the branch
  /// pre-token from the login response.
  String? get activeAccessToken =>
      _sessionToken ?? selectedOrganization?.activeAccessToken;

  int? get activeBranchId => selectedOrganization?.activeBranch?.id;

  String? get activeRefreshToken =>
      selectedOrganization?.activeBranch?.refreshToken;

  /// True once the active token is within [_refreshBuffer] of (or past) its
  /// expiration — signals the interceptor to refresh before the next call.
  bool get isTokenExpiringSoon {
    final expiry = selectedOrganization?.activeBranch?.tokenExpiration;
    if (expiry == null) return false;
    return DateTime.now().isAfter(expiry.subtract(_refreshBuffer));
  }

  Future<void> saveCredentials(String email, String password) async {
    savedEmail = email;
    savedPassword = password;
    await storage.setValues(StorageKeys.userEmail, email);
    await storage.setValues(StorageKeys.userPassword, password);
  }

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

  /// Persists the final session token returned by the SelectBranch API
  /// (login or refresh) — also writes the refreshed expiry/refresh-token
  /// back into the active branch of [selectedOrganization].
  Future<void> updateActiveSession(AuthToken authToken) async {
    final token = authToken.accessToken;
    if (token == null) return;

    _sessionToken = token;
    await storage.setValues(StorageKeys.token, token);

    final org = selectedOrganization;
    if (org != null) {
      await saveSelectedOrganization(
        org.withUpdatedActiveBranchToken(
          accessToken: authToken.accessToken,
          refreshToken: authToken.refreshToken,
          tokenExpiration: authToken.expiration,
        ),
      );
    }
  }

  bool hasFeature(String featureKey) => userFeatures.contains(featureKey);

  Future<void> saveUserFeatures(List<String> features) async {
    userFeatures = features;
    await storage.setValues(StorageKeys.userFeatures, jsonEncode(features));
  }

  Future<void> saveUserRoles(List<String> roles) async {
    userRoles = roles;
    isAdmin = roles.any(
      (r) => AppConstants.adminRoles.contains(r.toLowerCase().trim()),
    );
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

      savedEmail = await storage.readValues(StorageKeys.userEmail);
      savedPassword = await storage.readValues(StorageKeys.userPassword);

      final featuresJson = await storage.readValues(StorageKeys.userFeatures);
      if (featuresJson != null) {
        userFeatures = List<String>.from(jsonDecode(featuresJson) as List);
      }

      final rolesJson = await storage.readValues(StorageKeys.userRoles);
      if (rolesJson != null) {
        userRoles = List<String>.from(jsonDecode(rolesJson) as List);
        isAdmin = userRoles.any(
          (r) => AppConstants.adminRoles.contains(r.toLowerCase().trim()),
        );
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
    savedEmail = null;
    savedPassword = null;
    islogin = false;
    isAdmin = false;
    await storage.setValues(StorageKeys.loggedIn, 'false');
    await storage.clearValues(StorageKeys.userDetails);
    await storage.clearValues(StorageKeys.selectedOrganization);
    await storage.clearValues(StorageKeys.token);
    await storage.clearValues(StorageKeys.userFeatures);
    await storage.clearValues(StorageKeys.userRoles);
    await storage.clearValues(StorageKeys.userEmail);
    await storage.clearValues(StorageKeys.userPassword);
  }
}
