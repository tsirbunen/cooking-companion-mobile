import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/business_logic/models/bloc_status/bloc_status.dart';
import 'package:mobile/business_logic/models/recipe/recipe.dart';
import 'package:mobile/business_logic/wizard_logic/utils.dart';
import 'package:mobile/business_logic/wizard_logic/wizard_event.dart';
import 'package:mobile/business_logic/wizard_logic/wizard_state.dart';
import 'package:mobile/repositories/recipes/repositories/recipe_repository.dart';
import 'package:mobile/repositories/common/models/either/either.dart';
import 'package:mobile/repositories/common/models/failure/failure.dart';

const String someDataIsMissing = 'Some data is missing!';

class WizardBloc extends Bloc<WizardEvent, WizardState> {
  final RecipeRepository _recipeRepository;
  WizardBloc(this._recipeRepository) : super(const WizardState()) {
    on<WizardEvent>(_onEvent);
  }

  Future<void> _onEvent(WizardEvent event, Emitter<WizardState> emit) async {
    return switch (event) {
      final EditRecipeEvent e => _onEditRecipeEvent(e, emit),
      final TitleChangedEvent e => _onTitleChangedEvent(e, emit),
      final OvenNeededChangedEvent e => _onOvenNeededChangedEvent(e, emit),
      final DescriptionChangedEvent e => _onDescriptionChangedEvent(e, emit),
      final IngredientChangedEvent e => _onIngredientChangedEvent(e, emit),
      final InstructionChangedEvent e => _onInstructionChangedEvent(e, emit),
      final TagChangedEvent e => _onTagChangedEvent(e, emit),
      final LanguageChangedEvent e => _onLanguageChangedEvent(e, emit),
      final SubmitRecipeEvent e => _onSubmitRecipeEvent(e, emit),
      final ClearFormEvent e => _onClearFormEvent(e, emit),
      final ResetFormEvent e => _onResetFormEvent(e, emit),
      final WizardEvent _ => emit(state),
    };
  }

  Future<void> _onResetFormEvent(
    ResetFormEvent event,
    Emitter<WizardState> emit,
  ) async {
    if (state.originalRecipe == null) return;
    final newStateWithExistingRecipe =
        state.copyWithRecipe(state.originalRecipe!);
    if (newStateWithExistingRecipe == null) return;
    emit(newStateWithExistingRecipe);
  }

  Future<void> _onClearFormEvent(
    ClearFormEvent event,
    Emitter<WizardState> emit,
  ) async {
    emit(const WizardState());
  }

  Future<void> _onEditRecipeEvent(
    EditRecipeEvent event,
    Emitter<WizardState> emit,
  ) async {
    final recipeId = event.recipeId;
    final recipe = _recipeRepository.getRecipeById(recipeId);
    if (recipe == null) return;

    final newStateWithExistingRecipe = state.copyWithRecipe(recipe);
    if (newStateWithExistingRecipe == null) return;
    emit(newStateWithExistingRecipe);
  }

  Future<void> _onSubmitRecipeEvent(
    SubmitRecipeEvent event,
    Emitter<WizardState> emit,
  ) async {
    final isCreate = state.id == null;

    emit(state.copyWith(newStatus: Status.submitting));

    final Either<Failure, Recipe> result = isCreate
        ? await _handleSubmitCreateRecipe()
        : await _handleSubmitPatchRecipe();

    result.match(
      (data) => emit(
        state.copyWith(
          newStatus: isCreate ? Status.recipeCreated : Status.recipePatched,
          newId: data!.id,
        ),
      ),
      (failure) => emit(
        // FIXME: Handle showing error message to user
        state.copyWith(
          newStatus: Status.ok,
        ),
      ),
    );
  }

  Future<Either<Failure, Recipe>> _handleSubmitCreateRecipe() async {
    final input = getCreateRecipeInput(state);
    if (input == null) {
      return Either.failure(const Failure(someDataIsMissing));
    }
    final Either<Failure, Recipe> result =
        await _recipeRepository.createRecipe(input);
    return result;
  }

  Future<Either<Failure, Recipe>> _handleSubmitPatchRecipe() async {
    final input = getPatchRecipeInput(state);
    if (input == null) {
      return Either.failure(const Failure(someDataIsMissing));
    }
    final Either<Failure, Recipe> result =
        await _recipeRepository.patchRecipe(input);
    return result;
  }

  Future<void> _onTitleChangedEvent(
    TitleChangedEvent event,
    Emitter<WizardState> emit,
  ) async {
    if (event.content == null) {
      emit(state.copyWithClearField(clearTitle: true));
      return;
    }

    emit(state.copyWith(newTitle: event.content));
  }

  Future<void> _onOvenNeededChangedEvent(
    OvenNeededChangedEvent event,
    Emitter<WizardState> emit,
  ) async {
    if (event.ovenNeeded == null) {
      emit(state.copyWithClearField(clearOvenNeeded: true));
      return;
    }

    emit(state.copyWith(newOvenNeeded: event.ovenNeeded));
  }

  Future<void> _onDescriptionChangedEvent(
    DescriptionChangedEvent event,
    Emitter<WizardState> emit,
  ) async {
    if (event.content == null) {
      emit(state.copyWithClearField(clearDescription: true));
      return;
    }

    emit(state.copyWith(newDescription: event.content));
  }

  Future<void> _onTagChangedEvent(
    TagChangedEvent event,
    Emitter<WizardState> emit,
  ) async {
    List<TagElement> tags = state.tags != null ? [...state.tags!] : [];
    if (shouldNeglectEvent(event, tags)) return;

    final updatedTags = updateList<TagElement>(event, tags);
    emit(state.copyWith(newTags: updatedTags));
  }

  Future<void> _onLanguageChangedEvent(
    LanguageChangedEvent event,
    Emitter<WizardState> emit,
  ) async {
    emit(state.copyWith(newLanguage: event.content));
  }

  Future<void> _onIngredientChangedEvent(
    IngredientChangedEvent event,
    Emitter<WizardState> emit,
  ) async {
    List<IngredientElement> ingredients =
        state.ingredients != null ? [...state.ingredients!] : [];
    if (shouldNeglectEvent(event, ingredients)) return;

    final updatedIngredients = updateList(event, ingredients);
    emit(state.copyWith(newIngredients: updatedIngredients));
  }

  Future<void> _onInstructionChangedEvent(
    InstructionChangedEvent event,
    Emitter<WizardState> emit,
  ) async {
    List<InstructionElement> instructions =
        state.instructions != null ? [...state.instructions!] : [];
    if (shouldNeglectEvent(event, instructions)) return;

    final updatedInstructions = updateList(event, instructions);
    emit(state.copyWith(newInstructions: updatedInstructions));
  }
}
