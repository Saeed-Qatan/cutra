import 'package:shared_preferences/shared_preferences.dart';
import '../errors/exceptions.dart';
import 'storage_service.dart';

/// Implementation of StorageService backed by SharedPreferences.
class SharedPrefsService implements StorageService {
  final SharedPreferences _prefs;

  SharedPrefsService(this._prefs);

  /// Factory constructor to asynchronously initialize SharedPreferences
  static Future<SharedPrefsService> getInstance() async {
    final prefs = await SharedPreferences.getInstance();
    return SharedPrefsService(prefs);
  }

  @override
  Future<String?> readString(String key) async {
    try {
      return _prefs.getString(key);
    } catch (e) {
      throw CacheException('Failed to read string key $key: $e');
    }
  }

  @override
  Future<void> writeString(String key, String value) async {
    try {
      final persisted = await _prefs.setString(key, value);
      if (!persisted) {
        throw CacheException('Failed to write string key $key');
      }
    } catch (e) {
      if (e is CacheException) rethrow;
      throw CacheException('Failed to write string key $key: $e');
    }
  }

  @override
  Future<int?> readInt(String key) async {
    try {
      return _prefs.getInt(key);
    } catch (e) {
      throw CacheException('Failed to read int key $key: $e');
    }
  }

  @override
  Future<void> writeInt(String key, int value) async {
    try {
      final persisted = await _prefs.setInt(key, value);
      if (!persisted) {
        throw CacheException('Failed to write int key $key');
      }
    } catch (e) {
      if (e is CacheException) rethrow;
      throw CacheException('Failed to write int key $key: $e');
    }
  }

  @override
  Future<bool?> readBool(String key) async {
    try {
      return _prefs.getBool(key);
    } catch (e) {
      throw CacheException('Failed to read bool key $key: $e');
    }
  }

  @override
  Future<void> writeBool(String key, bool value) async {
    try {
      final persisted = await _prefs.setBool(key, value);
      if (!persisted) {
        throw CacheException('Failed to write bool key $key');
      }
    } catch (e) {
      if (e is CacheException) rethrow;
      throw CacheException('Failed to write bool key $key: $e');
    }
  }

  @override
  Future<void> delete(String key) async {
    try {
      final persisted = await _prefs.remove(key);
      if (!persisted) {
        throw CacheException('Failed to delete key $key');
      }
    } catch (e) {
      if (e is CacheException) rethrow;
      throw CacheException('Failed to delete key $key: $e');
    }
  }

  @override
  Future<void> clear() async {
    try {
      final persisted = await _prefs.clear();
      if (!persisted) {
        throw CacheException('Failed to clear preferences');
      }
    } catch (e) {
      if (e is CacheException) rethrow;
      throw CacheException('Failed to clear preferences: $e');
    }
  }
}
