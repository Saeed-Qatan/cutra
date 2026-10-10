import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/api_client.dart';
import '../models/auth_models.dart';

/// Contract for Auth operations against the remote API.
abstract class AuthRemoteDataSource {
  Future<AuthSessionModel> login(LoginRequestModel request);

  Future<AuthSessionModel> register(RegisterRequestModel request);

  Future<AuthSessionModel> session(String accessToken);

  Future<void> logout(String accessToken);
}

/// API-backed Auth remote data source.
class ApiAuthRemoteDataSource implements AuthRemoteDataSource {
  final ApiClient _apiClient;

  const ApiAuthRemoteDataSource(this._apiClient);

  @override
  Future<AuthSessionModel> login(LoginRequestModel request) async {
    final response = await _apiClient.post(
      ApiEndpoints.authLogin,
      data: request.toJson(),
    );
    return _parseSession(response);
  }

  @override
  Future<AuthSessionModel> register(RegisterRequestModel request) async {
    final response = await _apiClient.post(
      ApiEndpoints.authRegister,
      data: request.toJson(),
    );
    return _parseSession(response);
  }

  @override
  Future<AuthSessionModel> session(String accessToken) async {
    final response = await _apiClient.get(
      ApiEndpoints.authSession,
      headers: _authHeaders(accessToken),
    );
    return _parseSession(response);
  }

  @override
  Future<void> logout(String accessToken) async {
    await _apiClient.post(
      ApiEndpoints.authLogout,
      headers: _authHeaders(accessToken),
    );
  }

  Map<String, String> _authHeaders(String accessToken) {
    return <String, String>{'Authorization': 'Bearer $accessToken'};
  }

  AuthSessionModel _parseSession(dynamic response) {
    final payload = _unwrapData(response);
    if (payload is! Map) {
      throw const AuthException('Invalid auth response shape');
    }
    return AuthSessionModel.fromJson(Map<String, dynamic>.from(payload));
  }

  dynamic _unwrapData(dynamic response) {
    if (response is Map && response['data'] is Map) {
      return response['data'];
    }
    return response;
  }
}
