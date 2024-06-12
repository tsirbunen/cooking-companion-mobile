import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'api_service.dart';

const apiServiceNotImplemented = 'Api client not implemented yet!';

// Note: This provider is first created without implementation. Later on,
// it will be overridden with the real implementation.
final apiServiceProvider = Provider<ApiService>((ref) {
  throw UnimplementedError(apiServiceNotImplemented);
});

Future<Override> getApiServiceProviderOverride() async {
  final apiService = ApiService().initialize(withQueryInterceptor: true);
  return apiServiceProvider.overrideWithValue(apiService);
}
