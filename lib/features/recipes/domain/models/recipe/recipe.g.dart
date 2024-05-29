// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecipeImpl _$$RecipeImplFromJson(Map<String, dynamic> json) => _$RecipeImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      language: Language.fromJson(json['language'] as Map<String, dynamic>),
      ovenNeeded: json['ovenNeeded'] as bool,
      description: json['description'] as String?,
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => Photo.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      ingredientGroups: (json['ingredientGroups'] as List<dynamic>)
          .map((e) => IngredientGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      instructionGroups: (json['instructionGroups'] as List<dynamic>)
          .map((e) => InstructionGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RecipeImplToJson(_$RecipeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'language': instance.language,
      'ovenNeeded': instance.ovenNeeded,
      'description': instance.description,
      'photos': instance.photos,
      'tags': instance.tags,
      'ingredientGroups': instance.ingredientGroups,
      'instructionGroups': instance.instructionGroups,
    };
