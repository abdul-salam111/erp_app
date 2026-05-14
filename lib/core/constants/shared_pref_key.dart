import '../local_storage/storage.dart';

class StorageKeys {
  static const String loggedIn = 'loggedIn';
  static const String token = "token";
  static const String userId = 'userId';
  static const String userDetails = 'userDetails';
}

extension LocalStorageGetters on LocalStorage {
  Future<String?> get userId async {
    return await readValues(StorageKeys.userId);
  }

  Future<String?> get userToken async {
    return await readValues(StorageKeys.token);
  }
}
