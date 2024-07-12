// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_recipe_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateRecipeInputImpl _$$CreateRecipeInputImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateRecipeInputImpl(
      title: json['title'] as String,
      language: json['language'] as String,
      ovenNeeded: json['ovenNeeded'] as bool,
      description: json['description'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      ingredientGroups: (json['ingredientGroups'] as List<dynamic>)
          .map((e) => IngredientGroupInput.fromJson(e as Map<String, dynamic>))
          .toList(),
      instructionGroups: (json['instructionGroups'] as List<dynamic>)
          .map((e) => InstructionGroupInput.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CreateRecipeInputImplToJson(
        _$CreateRecipeInputImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'language': instance.language,
      'ovenNeeded': instance.ovenNeeded,
      'description': instance.description,
      'tags': instance.tags,
      'ingredientGroups':
          instance.ingredientGroups.map((e) => e.toJson()).toList(),
      'instructionGroups':
          instance.instructionGroups.map((e) => e.toJson()).toList(),
    };
