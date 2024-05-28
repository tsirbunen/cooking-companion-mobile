// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IngredientGroupImpl _$$IngredientGroupImplFromJson(
        Map<String, dynamic> json) =>
    _$IngredientGroupImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String?,
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$IngredientGroupImplToJson(
        _$IngredientGroupImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'ingredients': instance.ingredients,
    };
