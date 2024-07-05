import 'package:flutter_riverpod/flutter_riverpod.dart';

class IngredientInput {
  final double amount;
  final String unit;
  final String name;

  IngredientInput(this.amount, this.unit, this.name);
}

final ingredientsInFormProvider =
    NotifierProvider<IngredientsInFormController, List<IngredientInput>>(
        IngredientsInFormController.new);

class IngredientsInFormController extends Notifier<List<IngredientInput>> {
  @override
  List<IngredientInput> build() {
    return [];
  }

  void addIngredient(IngredientInput newInput) {
    state = [...state, newInput];
  }

  void removeIngredient(int index) {
    state = [...state]..removeAt(index);
  }

  void updateIngredient(int index, IngredientInput newInput) {
    state = [...state]..[index] = newInput;
  }
}
