class WizardEvent {}

class EditRecipeEvent extends WizardEvent {
  final int recipeId;
  EditRecipeEvent({required this.recipeId});
}

class SubmitRecipeEvent extends WizardEvent {}

class ClearFormEvent extends WizardEvent {}

class ResetFormEvent extends WizardEvent {}

abstract class WizardListEvent<T> {
  final int index;
  WizardListEvent({required this.index});

  bool isEmpty() => throw UnimplementedError();
  T toElement() => throw UnimplementedError();
}

typedef TagElement = ({int? id, String content});
typedef IngredientElement = ({
  int? id,
  double? amount,
  String? unit,
  String content
});
typedef InstructionElement = ({int? id, String content});

class TitleChangedEvent extends WizardEvent {
  final String? content;
  TitleChangedEvent({this.content});
}

class IngredientChangedEvent extends WizardEvent implements WizardListEvent {
  @override
  final int index;
  final int? id;
  final double? amount;
  final String? unit;
  final String? content;
  IngredientChangedEvent({
    required this.index,
    this.id,
    this.amount,
    this.unit,
    this.content,
  });
  @override
  bool isEmpty() =>
      (content == null || content!.isEmpty) &&
      (amount == null || amount == 0) &&
      (unit == null || unit!.isEmpty);

  @override
  IngredientElement? toElement() => content != null
      ? (
          id: id,
          amount: amount,
          unit: unit,
          content: content!,
        )
      : null;
}

class InstructionChangedEvent extends WizardEvent implements WizardListEvent {
  @override
  final int index;
  final int? id;
  final String? content;
  InstructionChangedEvent({
    required this.index,
    this.id,
    this.content,
  });

  @override
  bool isEmpty() => content == null || content!.isEmpty;

  @override
  InstructionElement? toElement() =>
      content != null ? (id: id, content: content!) : null;
}

class OvenNeededChangedEvent extends WizardEvent {
  final bool? ovenNeeded;
  OvenNeededChangedEvent({this.ovenNeeded});
}

class LanguageChangedEvent extends WizardEvent {
  final String? content;
  LanguageChangedEvent({this.content});
}

class TagChangedEvent extends WizardEvent implements WizardListEvent {
  @override
  final int index;
  final int? id;
  final String? content;
  TagChangedEvent({required this.index, this.id, this.content});

  @override
  bool isEmpty() => content == null || content!.isEmpty;

  @override
  TagElement? toElement() =>
      content != null ? (id: id, content: content!) : null;
}

class DescriptionChangedEvent extends WizardEvent {
  final String? content;
  DescriptionChangedEvent({this.content});
}
