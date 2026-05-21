import 'dart:convert';
import 'package:mantic_erp_app/features/auth/auth_exports.dart';
import '../constants/const_exports.dart';
import '../local_storage/storage.dart';

class SessionController {
  static final SessionController _session = SessionController._internal();
  SessionController._internal();

  static SessionController get instance => _session;
  factory SessionController() => _session;

  LoggedInUserModel? loggedInUser;
  Organization? selectedOrganization;
  bool islogin = false;

  /// The active access token from the first branch of the selected organization.
  String? get activeAccessToken =>
      selectedOrganization?.branches?.firstOrNull?.authToken?.accessToken;

  Future<void> saveUserInStorage(LoggedInUserModel user) async {
    loggedInUser = user;
    await storage.setValues(StorageKeys.loggedIn, 'true');
    await storage.setValues(StorageKeys.userDetails, jsonEncode(user.toJson()));
    islogin = true;
  }

  Future<void> saveSelectedOrganization(Organization org) async {
    selectedOrganization = org;
    await storage.setValues(
      StorageKeys.selectedOrganization,
      jsonEncode(org.toJson()),
    );
    final token = org.branches?.firstOrNull?.authToken?.accessToken;
    if (token != null) {
      await storage.setValues(StorageKeys.token, token);
    }
  }

  Future<void> getUserFromStorage() async {
    try {
      final userData = await storage.readValues(StorageKeys.userDetails);
      if (userData != null) {
        loggedInUser = LoggedInUserModel.fromJson(jsonDecode(userData));
      }

      final orgData = await storage.readValues(StorageKeys.selectedOrganization);
      if (orgData != null) {
        selectedOrganization = Organization.fromJson(jsonDecode(orgData));
      }

      final isLoggedIn = await storage.readValues(StorageKeys.loggedIn);
      islogin = isLoggedIn == 'true';
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> clearSession() async {
    loggedInUser = null;
    selectedOrganization = null;
    islogin = false;
    await storage.setValues(StorageKeys.loggedIn, 'false');
    await storage.clearValues(StorageKeys.userDetails);
    await storage.clearValues(StorageKeys.selectedOrganization);
    await storage.clearValues(StorageKeys.token);
  }
}
