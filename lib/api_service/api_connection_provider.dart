import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'api_connection.dart';

const apiConnectionNotImplemented = 'Api connection not implemented yet!';

// Note: This provider is created without implementation. Once the api
// connection is available, the provider will be overridden with the real
// implementation.

final apiConnectionProvider = Provider<ApiConnection>((ref) {
  throw UnimplementedError(apiConnectionNotImplemented);
});

Future<Override> getApiConnectionOverride() async {
  final apiConnection = ApiConnection().initialize();
  return apiConnectionProvider.overrideWithValue(apiConnection);
}
