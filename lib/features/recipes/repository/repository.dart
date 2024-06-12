import 'package:mobile/utils/either/either.dart';
import 'package:mobile/core/api_service/api_service.dart';
import 'package:mobile/utils/failure/failure.dart';
import 'package:mobile/features/recipes/domain/models/recipe/recipe.dart';
import 'package:mobile/features/recipes/domain/use_cases/repository_interface.dart';
import 'package:mobile/features/recipes/repository/graph_ql.dart';

const noDataMessage = 'Failed to get any recipe data!';

/// InitialRecipesRepository provides the initial recipes data to the domain layer.
/// It implements the interface defined in the domain layer, but is responsible for
/// deciding where and how to get the data.
class InitialRecipesRepository implements InitialRecipesRepositoryInterface {
  final ApiService _apiService;
  InitialRecipesRepository(this._apiService);

  @override
  Future<Either<Failure, List<Recipe>>> getInitialRecipes() async {
    final query = InitialRecipesQuery();
    final response = await _apiService.performQuery(query.query);

    return response.match<Either<Failure, List<Recipe>>>(
      (data) {
        if (data == null) return Either.failure(const Failure(noDataMessage));
        if (data.isEmpty) return Either.value([]);

        final List<Recipe> recipes = (data[query.name])
            .map<Recipe>((recipe) => Recipe.fromJson(recipe))
            .toList();

        return Either(value: recipes);
      },
      (failure) {
        return Either.failure(failure);
      },
    );
  }
}
