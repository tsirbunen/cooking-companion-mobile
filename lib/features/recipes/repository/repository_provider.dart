import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/core/api_service/api_service_provider.dart';
import 'package:mobile/features/recipes/repository/repository.dart';

final repositoryProvider = Provider<InitialRecipesRepository>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return InitialRecipesRepository(apiService);
});
