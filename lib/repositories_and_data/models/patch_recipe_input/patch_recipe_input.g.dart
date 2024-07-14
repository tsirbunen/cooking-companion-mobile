// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patch_recipe_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatchRecipeInputImpl _$$PatchRecipeInputImplFromJson(
        Map<String, dynamic> json) =>
    _$PatchRecipeInputImpl(
      recipeId: (json['recipeId'] as num).toInt(),
      fieldsToInclude: (json['fieldsToInclude'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      title: json['title'] as String?,
      language: json['language'] as String?,
      ovenNeeded: json['ovenNeeded'] as bool?,
      description: json['description'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      ingredientGroups: (json['ingredientGroups'] as List<dynamic>?)
          ?.map((e) => IngredientGroupInput.fromJson(e as Map<String, dynamic>))
          .toList(),
      instructionGroups: (json['instructionGroups'] as List<dynamic>?)
          ?.map(
              (e) => InstructionGroupInput.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PatchRecipeInputImplToJson(
        _$PatchRecipeInputImpl instance) =>
    <String, dynamic>{
      'recipeId': instance.recipeId,
      'fieldsToInclude': instance.fieldsToInclude,
      'title': instance.title,
      'language': instance.language,
      'ovenNeeded': instance.ovenNeeded,
      'description': instance.description,
      'tags': instance.tags,
      'ingredientGroups':
          instance.ingredientGroups?.map((e) => e.toJson()).toList(),
      'instructionGroups':
          instance.instructionGroups?.map((e) => e.toJson()).toList(),
    };
