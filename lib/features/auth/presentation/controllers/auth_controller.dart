import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/router/auth_status.dart';
import '../../../../core/errors/error_handler.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/providers/core_providers.dart';
import '../../data/datasources/auth_local_data_source.dart';
import '../../data/datasources/auth_remote_data_source.dart';
import '../../data/models/auth_models.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  return ApiAuthRemoteDataSource(ref.watch(apiClientProvider));
});

final authLocalDataSourceProvider = Provider<AuthLocalDataSource>((ref) {
  return SecureAuthLocalDataSource(ref.watch(secureStorageProvider));
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    remoteDataSource: ref.watch(authRemoteDataSourceProvider),
    localDataSource: ref.watch(authLocalDataSourceProvider),
  );
});

final authControllerProvider = AsyncNotifierProvider<AuthController, AuthState>(
  AuthController.new,
);

/// UI state exposed by the Auth controller.
class AuthState {
  final AuthStatus status;
  final AuthSessionModel? session;
  final Failure? failure;
  final bool isSubmitting;

  const AuthState({
    required this.status,
    this.session,
    this.failure,
    this.isSubmitting = false,
  });

  const AuthState.checking()
    : status = AuthStatus.checking,
      session = null,
      failure = null,
      isSubmitting = false;

  const AuthState.unauthenticated({this.failure})
    : status = AuthStatus.unauthenticated,
      session = null,
      isSubmitting = false;

  factory AuthState.fromSession(AuthSessionModel session) {
    return AuthState(status: _statusFromSession(session), session: session);
  }

  AuthState copyWith({
    AuthStatus? status,
    AuthSessionModel? session,
    Failure? failure,
    bool clearFailure = false,
    bool? isSubmitting,
  }) {
    return AuthState(
      status: status ?? this.status,
      session: session ?? this.session,
      failure: clearFailure ? null : failure ?? this.failure,
      isSubmitting: isSubmitting ?? this.isSubmitting,
    );
  }

  static AuthStatus _statusFromSession(AuthSessionModel session) {
    return switch (session.approvalStatus) {
      AuthApprovalStatus.pending => AuthStatus.pending,
      AuthApprovalStatus.rejected => AuthStatus.rejected,
      AuthApprovalStatus.approved => AuthStatus.authenticated,
    };
  }
}

/// Coordinates Auth flows and keeps GoRouter's AuthStatus in sync.
class AuthController extends AsyncNotifier<AuthState> {
  AuthRepository get _repository => ref.read(authRepositoryProvider);

  @override
  Future<AuthState> build() async {
    return _restoreSession();
  }

  Future<void> login({required String email, required String password}) async {
    await _submit(
      action: () => _repository.login(email: email, password: password),
      fallbackStatus: AuthStatus.unauthenticated,
    );
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    await _submit(
      action: () => _repository.register(
        name: name,
        email: email,
        password: password,
        passwordConfirmation: passwordConfirmation,
      ),
      fallbackStatus: AuthStatus.unauthenticated,
    );
  }

  Future<void> refreshSession() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(_refreshSession);
  }

  Future<void> logout() async {
    state = AsyncData(
      _current.copyWith(isSubmitting: true, clearFailure: true),
    );
    try {
      await _repository.logout();
      const next = AuthState.unauthenticated();
      _syncStatus(next.status);
      state = const AsyncData(next);
    } catch (error) {
      final failure = ErrorHandler.handle(error);
      final next = _current.copyWith(failure: failure, isSubmitting: false);
      _syncStatus(next.status);
      state = AsyncData(next);
    }
  }

  Future<void> _submit({
    required Future<AuthSessionModel> Function() action,
    required AuthStatus fallbackStatus,
  }) async {
    state = AsyncData(
      _current.copyWith(isSubmitting: true, clearFailure: true),
    );

    try {
      final session = await action();
      final next = AuthState.fromSession(session);
      _syncStatus(next.status);
      state = AsyncData(next);
    } catch (error) {
      final next = AuthState(
        status: fallbackStatus,
        failure: ErrorHandler.handle(error),
      );
      _syncStatus(next.status);
      state = AsyncData(next);
    }
  }

  Future<AuthState> _restoreSession() async {
    try {
      final session = await _repository.restoreSession();
      final next = session == null
          ? const AuthState.unauthenticated()
          : AuthState.fromSession(session);
      _syncStatus(next.status);
      return next;
    } catch (error) {
      final next = AuthState.unauthenticated(
        failure: ErrorHandler.handle(error),
      );
      _syncStatus(next.status);
      return next;
    }
  }

  Future<AuthState> _refreshSession() async {
    try {
      final session = await _repository.refreshSession();
      final next = AuthState.fromSession(session);
      _syncStatus(next.status);
      return next;
    } catch (error) {
      final next = AuthState.unauthenticated(
        failure: ErrorHandler.handle(error),
      );
      _syncStatus(next.status);
      return next;
    }
  }

  AuthState get _current => state.valueOrNull ?? const AuthState.checking();

  void _syncStatus(AuthStatus status) {
    ref.read(authStatusProvider.notifier).setStatus(status);
  }
}
