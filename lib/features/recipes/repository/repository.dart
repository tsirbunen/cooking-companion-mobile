import 'package:mobile/utils/either/either.dart';
import 'package:mobile/core/api_service/api_client.dart';
import 'package:mobile/utils/failure/failure.dart';
import 'package:mobile/features/recipes/domain/models/recipe/recipe.dart';
import 'package:mobile/features/recipes/domain/use_cases/repository_interface.dart';
import 'package:mobile/features/recipes/repository/graph_ql.dart';

const apiErrorLabel = 'Api error:';
const defaultException = 'Oops! Some error occurred...';

/// InitialRecipesRepository provides the initial recipes data to the domain layer.
/// It implements the interface defined in the domain layer, but is responsible for
/// deciding where and how to get the data.
class InitialRecipesRepository implements InitialRecipesRepositoryInterface {
  final ApiClient _client;
  InitialRecipesRepository(this._client);

  @override
  Future<Either<Failure, List<Recipe>>> getInitialRecipes() async {
    try {
      final response = await _client.performQuery(getInitialRecipesQuery);
      if (response.hasException || response.data == null) {
        final exception = response.exception;
        return Either(left: Failure('$apiErrorLabel $exception'));
      }

      final recipesRaw = response.data![queryName] as List<dynamic>;
      final recipes =
          recipesRaw.map((recipe) => Recipe.fromJson(recipe)).toList();

      return Either(right: recipes);
    } catch (exception) {
      return Either(left: Failure('$apiErrorLabel $exception'));
    }
  }
}
