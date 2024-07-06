import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/logger/logger.dart';
import 'package:mobile/features/recipes/domain/models/recipe/recipe.dart';
import 'package:mobile/layers/business_logic/wizard/utils.dart';
import 'package:mobile/layers/business_logic/wizard/wizard_event.dart';
import 'package:mobile/layers/business_logic/wizard/wizard_state.dart';
import 'package:mobile/layers/repository/recipe_repository.dart';

class WizardBloc extends Bloc<WizardEvent, WizardState> {
  final RecipeRepository _recipeRepository;
  WizardBloc(this._recipeRepository) : super(const WizardState()) {
    on<WizardEvent>(_onEvent);
  }

  Future<void> _onEvent(WizardEvent event, Emitter<WizardState> emit) async {
    return switch (event) {
      final TitleChangedEvent e => _onTitleChangedEvent(e, emit),
      final OvenNeededChangedEvent e => _onOvenNeededChangedEvent(e, emit),
      final DescriptionChangedEvent e => _onDescriptionChangedEvent(e, emit),
      final IngredientChangedEvent e => _onIngredientChangedEvent(e, emit),
      final InstructionChangedEvent e => _onInstructionChangedEvent(e, emit),
      final TagChangedEvent e => _onTagChangedEvent(e, emit),
      final LanguageChangedEvent e => _onLanguageChangedEvent(e, emit),
      final SubmitRecipeEvent e => _onSubmitRecipeEvent(e, emit),
      final WizardEvent _ => emit(state),
    };
  }

  Future<void> _onSubmitRecipeEvent(
    SubmitRecipeEvent event,
    Emitter<WizardState> emit,
  ) async {
    final isCreate = state.id == null;
    logger.info('isCreate: $isCreate', runtimeType);
    // FIXME: Implement update recipe!
    if (!isCreate) return;

    final input = getCreateRecipeInput(state);
    if (input == null) return;

    emit(state.copyWith(newIsSubmitting: true));

    final Recipe? createdRecipe = await _recipeRepository.createRecipe(input);
    emit(state.copyWith(
      newIsSubmitting: false,
      newId: createdRecipe?.id,
    ));
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