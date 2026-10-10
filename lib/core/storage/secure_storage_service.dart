import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../errors/exceptions.dart';
import 'storage_service.dart';

/// Implementation of StorageService backed by FlutterSecureStorage for tokens/credentials.
class SecureStorageService implements StorageService {
  final FlutterSecureStorage _secureStorage;

  SecureStorageService({FlutterSecureStorage? secureStorage})
      : _secureStorage = secureStorage ?? const FlutterSecureStorage();

  @override
  Future<String?> readString(String key) async {
    try {
      return await _secureStorage.read(key: key);
    } catch (e) {
      throw CacheException('Failed to read secure string key $key: $e');
    }
  }

  @override
  Future<void> writeString(String key, String value) async {
    try {
      await _secureStorage.write(key: key, value: value);
    } catch (e) {
      throw CacheException('Failed to write secure string key $key: $e');
    }
  }

  @override
  Future<int?> readInt(String key) async {
    try {
      final valStr = await _secureStorage.read(key: key);
      return valStr != null ? int.tryParse(valStr) : null;
    } catch (e) {
      throw CacheException('Failed to read secure int key $key: $e');
    }
  }

  @override
  Future<void> writeInt(String key, int value) async {
    try {
      await _secureStorage.write(key: key, value: value.toString());
    } catch (e) {
      throw CacheException('Failed to write secure int key $key: $e');
    }
  }

  @override
  Future<bool?> readBool(String key) async {
    try {
      final valStr = await _secureStorage.read(key: key);
      return valStr != null ? valStr.toLowerCase() == 'true' : null;
    } catch (e) {
      throw CacheException('Failed to read secure bool key $key: $e');
    }
  }

  @override
  Future<void> writeBool(String key, bool value) async {
    try {
      await _secureStorage.write(key: key, value: value.toString());
    } catch (e) {
      throw CacheException('Failed to write secure bool key $key: $e');
    }
  }

  @override
  Future<void> delete(String key) async {
    try {
      await _secureStorage.delete(key: key);
    } catch (e) {
      throw CacheException('Failed to delete secure key $key: $e');
    }
  }

  @override
  Future<void> clear() async {
    try {
      await _secureStorage.deleteAll();
    } catch (e) {
      throw CacheException('Failed to clear secure storage: $e');
    }
  }
}
