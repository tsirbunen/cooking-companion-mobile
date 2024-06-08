import 'dart:async';
import 'package:mobile/utils/either/either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/utils/failure/failure.dart';
import 'package:mobile/features/recipes/domain/models/recipe/recipe.dart';
import 'package:mobile/features/recipes/domain/use_cases/use_case.dart';
import 'package:mobile/features/recipes/repository/repository_provider.dart';

/// This provider provides the initial recipe data through an async notifier
/// to any widget that "asks" for it. The async notifier's state can be any of
/// the three AsyncValue states: data, loading, or error. The notifier starts off
/// with the notifier in state loading, and the build method asynchronously
/// fetches the data when the provider is first accessed.
final initialRecipesProvider =
    AsyncNotifierProvider.autoDispose<InitialRecipesNotifier, List<Recipe>?>(
        () {
  return InitialRecipesNotifier();
});

/// Notifier holds (in its state field) a list of recipes as an AsyncValue
/// (i.e. a value that can be in one of three states: data, loading, or error).
/// The notifier acts as an adapter between the UI and the domain's use case logic.
class InitialRecipesNotifier extends AutoDisposeAsyncNotifier<List<Recipe>?> {
  @override
  FutureOr<List<Recipe>?> build() async {
    return await fetch();
  }

  FutureOr<List<Recipe>?> fetch() async {
    final repository = ref.read(repositoryProvider);
    final useCase = InitialRecipesUseCase(repository);
    final Either<Failure, List<Recipe>> result =
        await useCase.getInitialRecipes();
    return result.match(
      (recipes) => recipes,
      (failure) => throw Exception(result.failure!.message),
    );
  }
}
