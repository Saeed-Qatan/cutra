import 'dart:convert';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/storage/storage_service.dart';
import '../models/auth_models.dart';

/// Contract for local Auth session persistence.
abstract class AuthLocalDataSource {
  Future<AuthSessionModel?> readSession();

  Future<void> saveSession(AuthSessionModel session);

  Future<void> clearSession();
}

/// Secure-storage backed Auth local data source.
class SecureAuthLocalDataSource implements AuthLocalDataSource {
  static const _keyAccessToken = 'auth_access_token';
  static const _keyRefreshToken = 'auth_refresh_token';
  static const _keyAuthSession = 'auth_session';

  final StorageService _storage;

  const SecureAuthLocalDataSource(this._storage);

  @override
  Future<AuthSessionModel?> readSession() async {
    final value = await _storage.readString(_keyAuthSession);
    if (value == null || value.isEmpty) {
      return null;
    }

    try {
      final json = jsonDecode(value);
      if (json is! Map) {
        throw const FormatException('Session payload is not an object');
      }
      return AuthSessionModel.fromJson(Map<String, dynamic>.from(json));
    } on FormatException catch (e) {
      throw CacheException('Failed to parse stored auth session: $e');
    }
  }

  @override
  Future<void> saveSession(AuthSessionModel session) async {
    await _storage.writeString(_keyAccessToken, session.accessToken);
    await _storage.writeString(_keyRefreshToken, session.refreshToken);
    await _storage.writeString(
      _keyAuthSession,
      jsonEncode(session.toJson()),
    );
  }

  @override
  Future<void> clearSession() async {
    await _storage.delete(_keyAccessToken);
    await _storage.delete(_keyRefreshToken);
    await _storage.delete(_keyAuthSession);
  }
}
