import 'package:mobile/utils/either/either.dart';
import 'package:mobile/utils/failure/failure.dart';
import 'package:mobile/features/recipes/domain/models/recipe/recipe.dart';

abstract class InitialRecipesRepositoryInterface {
  Future<Either<Failure, List<Recipe>>> getInitialRecipes();
}
