import 'dart:convert';

import '../../app_exports.dart';

class SessionController {
  UserToken getUserDetails = UserToken();

  static final SessionController _session = SessionController._internal();
  bool islogin = false;
  String? userId;
  SessionController._internal();

  static SessionController get instance => _session;

  factory SessionController() {
    return _session;
  }

  Future<void> saveUserInStorage(UserToken user) async {
    await storage.setValues(StorageKeys.userDetails, jsonEncode(user));
    await storage.setValues(StorageKeys.loggedIn, 'true');
    await storage.setValues(StorageKeys.token, user.accessToken.toString());
  }

  Future<void> getUserfromSharedpref() async {
    try {
      final userData = await storage.readValues(StorageKeys.userDetails);
      if (userData != null) {
        SessionController().getUserDetails = UserToken.fromJson(
          jsonDecode(userData),
        );
      }
      final isLoggedIn = await storage.readValues(StorageKeys.loggedIn);
      SessionController().islogin = (isLoggedIn == 'true' ? true : false);
    } catch (e) {
      throw Exception(e);
    }
  }
}
