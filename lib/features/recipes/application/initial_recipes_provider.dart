import 'dart:async';
import 'package:mobile/utils/either/either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/utils/failure/failure.dart';
import 'package:mobile/features/recipes/domain/models/recipe/recipe.dart';
import 'package:mobile/features/recipes/domain/use_cases/use_case.dart';
import 'package:mobile/features/recipes/repository/repository_provider.dart';

/// This provider provides the initial recipe data to any widget that "asks" for it.
final initialRecipesProvider = AsyncNotifierProvider.autoDispose<
    InitialRecipesNotifier, AsyncValue<List<Recipe>>>(() {
  return InitialRecipesNotifier();
});

/// Notifier holds (in its state field) a list of recipes as an AsyncValue
/// (i.e. a value that can be in one of three states: data, loading, or error).
/// The notifier acts as an adapter between the UI and the domain's use case logic.
class InitialRecipesNotifier
    extends AutoDisposeAsyncNotifier<AsyncValue<List<Recipe>>> {
  /// The build method automatically and asynchronously asks for the initial recipe
  /// data from the domain's use case logic.
  @override
  FutureOr<AsyncValue<List<Recipe>>> build() async {
    return await refetch();
  }

  FutureOr<AsyncValue<List<Recipe>>> refetch() async {
    final repository = ref.read(repositoryProvider);
    final useCase = InitialRecipesUseCase(repository);
    final Either<Failure, List<Recipe>> result =
        await useCase.getInitialRecipes();

    return result.match(
      (recipes) {
        return AsyncValue.data(recipes);
      },
      (failure) {
        return AsyncValue.error(failure.message, StackTrace.current);
      },
    );
  }
}
