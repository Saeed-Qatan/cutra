import '../../../../core/errors/exceptions.dart';
import '../../models/auth_models.dart';
import '../auth_local_data_source.dart';
import '../auth_remote_data_source.dart';
import 'auth_repository.dart';

/// AuthRepository implementation that coordinates remote API and local session.
class LocalAuthRepository implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  const LocalAuthRepository({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<AuthSessionModel?> restoreSession() => localDataSource.readSession();

  @override
  Future<AuthSessionModel> login({required String email, required String password}) async {
    final session = await remoteDataSource.login(
      LoginRequestModel(email: email.trim(), password: password),
    );
    await localDataSource.saveSession(session);
    return session;
  }

  @override
  Future<AuthSessionModel> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    final session = await remoteDataSource.register(
      RegisterRequestModel(
        name: name.trim(),
        email: email.trim(),
        password: password,
        passwordConfirmation: passwordConfirmation,
      ),
    );
    await localDataSource.saveSession(session);
    return session;
  }

  @override
  Future<AuthSessionModel> refreshSession() async {
    final stored = await localDataSource.readSession();
    if (stored == null) throw const AuthException('No stored auth session');
    final session = await remoteDataSource.session(stored.accessToken);
    await localDataSource.saveSession(session);
    return session;
  }

  @override
  Future<void> logout() async {
    final stored = await localDataSource.readSession();
    if (stored != null) {
      try {
        await remoteDataSource.logout(stored.accessToken);
      } finally {
        await localDataSource.clearSession();
      }
      return;
    }
    await localDataSource.clearSession();
  }
}
