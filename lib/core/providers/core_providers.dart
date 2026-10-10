import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../app/router/auth_status.dart';
import '../network/api_client.dart';
import '../network/dio_api_client.dart';
import '../storage/secure_storage_service.dart';
import '../storage/shared_prefs_service.dart';
import '../storage/storage_service.dart';

/// Provider for ApiClient instance
final apiClientProvider = Provider<ApiClient>((ref) {
  return DioApiClient();
});

/// Provider for SecureStorageService instance
final secureStorageProvider = Provider<StorageService>((ref) {
  return SecureStorageService();
});

/// Provider for SharedPreferences instance (must be overridden in ProviderScope if async)
final sharedPreferencesInstanceProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError(
    'sharedPreferencesInstanceProvider must be overridden',
  );
});

/// Provider for SharedPrefsService instance
final sharedPrefsProvider = Provider<StorageService>((ref) {
  final prefs = ref.watch(sharedPreferencesInstanceProvider);
  return SharedPrefsService(prefs);
});

/// Notifier managing application AuthStatus
class AuthStatusNotifier extends Notifier<AuthStatus> {
  @override
  AuthStatus build() {
    return AuthStatus.checking;
  }

  /// Update active AuthStatus
  void setStatus(AuthStatus status) {
    state = status;
  }
}

/// Riverpod provider for active AuthStatus
final authStatusProvider = NotifierProvider<AuthStatusNotifier, AuthStatus>(() {
  return AuthStatusNotifier();
});
