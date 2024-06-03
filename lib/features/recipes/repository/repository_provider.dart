import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/core/api_service/api_client_provider.dart';
import 'package:mobile/features/recipes/repository/repository.dart';

final repositoryProvider = Provider<InitialRecipesRepository>((ref) {
  final apiClient = ref.read(apiClientProvider);
  return InitialRecipesRepository(apiClient);
});
