import '../../models/auth_models.dart';

/// Domain contract for authentication flows.
abstract class AuthRepository {
  Future<AuthSessionModel?> restoreSession();

  Future<AuthSessionModel> login({
    required String email,
    required String password,
  });

  Future<AuthSessionModel> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  });

  Future<AuthSessionModel> refreshSession();

  Future<void> logout();
}
