import 'package:cutra/app/router/auth_status.dart';
import 'package:cutra/core/network/api_client.dart';
import 'package:cutra/core/providers/core_providers.dart';
import 'package:cutra/core/storage/storage_service.dart';
import 'package:cutra/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:cutra/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:cutra/features/auth/data/models/auth_models.dart';
import 'package:cutra/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:cutra/features/auth/domain/repositories/auth_repository.dart';
import 'package:cutra/features/auth/presentation/controllers/auth_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Auth models', () {
    test('AuthSessionModel parses and serializes API payload', () {
      final session = AuthSessionModel.fromJson(_sessionJson());

      expect(session.accessToken, 'access-token');
      expect(session.approvalStatus, AuthApprovalStatus.approved);
      expect(session.user.email, 'user@example.com');
      expect(session.toJson()['approvalStatus'], 'approved');
    });
  });

  group('AuthRepositoryImpl', () {
    test('login sends request and stores returned session', () async {
      final apiClient = FakeApiClient(response: _sessionJson());
      final storage = FakeStorageService();
      final repository = AuthRepositoryImpl(
        remoteDataSource: ApiAuthRemoteDataSource(apiClient),
        localDataSource: SecureAuthLocalDataSource(storage),
      );

      final session = await repository.login(
        email: ' user@example.com ',
        password: 'secret',
      );

      expect(session.user.name, 'User Name');
      expect(apiClient.lastPath, '/auth/login');
      expect(apiClient.lastData, <String, dynamic>{
        'email': 'user@example.com',
        'password': 'secret',
      });
      expect(storage.values['auth_access_token'], 'access-token');
      expect(storage.values['auth_refresh_token'], 'refresh-token');
      expect(storage.values['auth_session'], isNotNull);
    });
  });

  group('AuthController', () {
    test('restores stored approved session and syncs AuthStatus', () async {
      final repository = FakeAuthRepository(storedSession: _session());
      final container = ProviderContainer(
        overrides: [authRepositoryProvider.overrideWithValue(repository)],
      );
      addTearDown(container.dispose);

      final state = await container.read(authControllerProvider.future);

      expect(state.status, AuthStatus.authenticated);
      expect(container.read(authStatusProvider), AuthStatus.authenticated);
    });

    test('login with pending account syncs pending AuthStatus', () async {
      final repository = FakeAuthRepository(
        loginSession: _session(approvalStatus: AuthApprovalStatus.pending),
      );
      final container = ProviderContainer(
        overrides: [authRepositoryProvider.overrideWithValue(repository)],
      );
      addTearDown(container.dispose);

      await container.read(authControllerProvider.future);
      await container
          .read(authControllerProvider.notifier)
          .login(email: 'user@example.com', password: 'secret');

      expect(container.read(authStatusProvider), AuthStatus.pending);
    });
  });
}

Map<String, dynamic> _sessionJson({
  AuthApprovalStatus approvalStatus = AuthApprovalStatus.approved,
}) {
  return <String, dynamic>{
    'accessToken': 'access-token',
    'refreshToken': 'refresh-token',
    'approvalStatus': approvalStatus.name,
    'user': <String, dynamic>{
      'id': 'user-id',
      'name': 'User Name',
      'email': 'user@example.com',
      'role': 'user',
    },
  };
}

AuthSessionModel _session({
  AuthApprovalStatus approvalStatus = AuthApprovalStatus.approved,
}) {
  return AuthSessionModel.fromJson(
    _sessionJson(approvalStatus: approvalStatus),
  );
}

class FakeApiClient implements ApiClient {
  final dynamic response;
  String? lastPath;
  dynamic lastData;

  FakeApiClient({required this.response});

  @override
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    lastPath = path;
    return response;
  }

  @override
  Future<dynamic> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    lastPath = path;
    lastData = data;
    return response;
  }

  @override
  Future<dynamic> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    lastPath = path;
    lastData = data;
    return response;
  }

  @override
  Future<dynamic> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    lastPath = path;
    lastData = data;
    return response;
  }
}

class FakeStorageService implements StorageService {
  final Map<String, String> values = <String, String>{};

  @override
  Future<void> clear() async {
    values.clear();
  }

  @override
  Future<void> delete(String key) async {
    values.remove(key);
  }

  @override
  Future<bool?> readBool(String key) async => null;

  @override
  Future<int?> readInt(String key) async => null;

  @override
  Future<String?> readString(String key) async => values[key];

  @override
  Future<void> writeBool(String key, bool value) async {}

  @override
  Future<void> writeInt(String key, int value) async {}

  @override
  Future<void> writeString(String key, String value) async {
    values[key] = value;
  }
}

class FakeAuthRepository implements AuthRepository {
  final AuthSessionModel? storedSession;
  final AuthSessionModel? loginSession;

  FakeAuthRepository({this.storedSession, this.loginSession});

  @override
  Future<AuthSessionModel?> restoreSession() async => storedSession;

  @override
  Future<AuthSessionModel> login({
    required String email,
    required String password,
  }) async {
    return loginSession ?? _session();
  }

  @override
  Future<AuthSessionModel> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    return loginSession ?? _session(approvalStatus: AuthApprovalStatus.pending);
  }

  @override
  Future<AuthSessionModel> refreshSession() async =>
      storedSession ?? _session();

  @override
  Future<void> logout() async {}
}
