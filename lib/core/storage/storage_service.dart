/// Generic contract for key-value storage operations.
abstract class StorageService {
  /// Read a string value for [key]
  Future<String?> readString(String key);

  /// Write a string [value] for [key]
  Future<void> writeString(String key, String value);

  /// Read an integer value for [key]
  Future<int?> readInt(String key);

  /// Write an integer [value] for [key]
  Future<void> writeInt(String key, int value);

  /// Read a boolean value for [key]
  Future<bool?> readBool(String key);

  /// Write a boolean [value] for [key]
  Future<void> writeBool(String key, bool value);

  /// Delete value associated with [key]
  Future<void> delete(String key);

  /// Clear all stored keys and values
  Future<void> clear();
}
