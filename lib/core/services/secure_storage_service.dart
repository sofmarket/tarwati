import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum SecureStorageEnum { token, userInfo }

class SecureStorageService {
  SecureStorageService() : _storage = const FlutterSecureStorage();

  final FlutterSecureStorage _storage;

  Future<void> write(String key, String value) async {
    try {
      await _storage.write(key: key, value: value);
    } catch (e) {
      print('Error writing to secure storage: $e');
    }
  }

  Future<String?> read(String key) async {
    return _storage.read(key: key);
  }

  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  Future<void> clear() async {
    await _storage.deleteAll();
  }

  Future<String?> getToken() async {
    return await read(SecureStorageEnum.token.name);
  }
}
