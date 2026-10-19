import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/errors/error_handler.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/providers/core_providers.dart';
import '../models/auth_models.dart';

/// Remote authentication service handling Login network requests using functional Either returns.
class AuthServices {
  final ApiClient _apiClient;

  const AuthServices(this._apiClient);

  /// Authenticates user with email and password credentials.
  /// Returns [Either] with [Failure] on error or response data on success.
  Future<Either<Failure, dynamic>> login(LoginModel credentials) async {
    try {
      final response = await _apiClient.post(
        ApiEndpoints.authLogin,
        data: credentials.toJson(),
      );
      return right(response);
    } catch (error) {
      return left(ErrorHandler.handle(error));
    }
  }
}

/// Riverpod provider exposing the [AuthServices] instance.
final authServicesProvider = Provider<AuthServices>(
  (ref) => AuthServices(ref.watch(apiClientProvider)),
);

/// Compatibility aliases for Login service.
typedef LoginService = AuthServices;
final loginServiceProvider = authServicesProvider;
