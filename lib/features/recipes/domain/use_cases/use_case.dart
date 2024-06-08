import 'dart:async';
import 'package:mobile/utils/either/either.dart';
import 'package:mobile/utils/failure/failure.dart';
import 'package:mobile/features/recipes/domain/models/recipe/recipe.dart';
import 'package:mobile/features/recipes/domain/use_cases/use_case_interface.dart';
import 'package:mobile/features/recipes/repository/repository.dart';

class InitialRecipesUseCase implements InitialRecipesUseCaseInterface {
  final InitialRecipesRepository _repository;
  InitialRecipesUseCase(this._repository);

  @override
  Future<Either<Failure, List<Recipe>>> getInitialRecipes() async {
    return await _repository.getInitialRecipes();
  }
}
