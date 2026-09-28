/// Abstraction for network client HTTP requests
abstract class ApiClient {
  /// GET request contract
  Future<Map<String, dynamic>> get(String endpoint);

  /// POST request contract
  Future<Map<String, dynamic>> post(
    String endpoint, {
    Map<String, dynamic>? body,
  });
}

/// Dummy implementation of ApiClient
class DummyApiClient implements ApiClient {
  @override
  Future<Map<String, dynamic>> get(String endpoint) async {
    return <String, dynamic>{'status': 'success'};
  }

  @override
  Future<Map<String, dynamic>> post(
    String endpoint, {
    Map<String, dynamic>? body,
  }) async {
    return <String, dynamic>{'status': 'success'};
  }
}
