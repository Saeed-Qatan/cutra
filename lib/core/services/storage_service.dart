/// Contract for local storage service
abstract class StorageService {
  /// Save integer value
  Future<void> setInt(String key, int value);

  /// Get integer value
  int? getInt(String key);
}

/// In-memory implementation of storage service
class InMemoryStorageService implements StorageService {
  final Map<String, dynamic> _data = <String, dynamic>{};

  @override
  Future<void> setInt(String key, int value) async {
    _data[key] = value;
  }

  @override
  int? getInt(String key) {
    return _data[key] as int?;
  }
}
