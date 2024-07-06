import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient_input.freezed.dart';
part 'ingredient_input.g.dart';

@freezed
class IngredientInput with _$IngredientInput {
  @JsonSerializable(explicitToJson: true)
  const factory IngredientInput({
    required String name,
    String? unit,
    double? amount,
  }) = _IngredientInput;

  factory IngredientInput.fromJson(Map<String, Object?> json) =>
      _$IngredientInputFromJson(json);
}
