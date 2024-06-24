import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/core/router/router.dart';

final routerProvider = Provider<RouterController>((ProviderRef ref) {
  return RouterController(ref);
});
