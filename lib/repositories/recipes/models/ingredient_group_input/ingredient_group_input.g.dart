// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_group_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IngredientGroupInputImpl _$$IngredientGroupInputImplFromJson(
        Map<String, dynamic> json) =>
    _$IngredientGroupInputImpl(
      title: json['title'] as String?,
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => IngredientInput.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$IngredientGroupInputImplToJson(
        _$IngredientGroupInputImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'ingredients': instance.ingredients.map((e) => e.toJson()).toList(),
    };
