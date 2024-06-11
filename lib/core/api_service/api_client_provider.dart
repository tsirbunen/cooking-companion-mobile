import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'api_client.dart';

const apiClientNotImplemented = 'Api client not implemented yet!';

// Note: This provider is first created without implementation. Later on,
// it will be overridden with the real implementation.
final apiClientProvider = Provider<ApiClient>((ref) {
  throw UnimplementedError(apiClientNotImplemented);
});

Future<Override> getApiClientProviderOverride() async {
  final apiClient = ApiClient().initialize();
  return apiClientProvider.overrideWithValue(apiClient);
}
