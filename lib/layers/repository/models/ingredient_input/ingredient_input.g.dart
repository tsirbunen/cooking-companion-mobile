// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IngredientInputImpl _$$IngredientInputImplFromJson(
        Map<String, dynamic> json) =>
    _$IngredientInputImpl(
      name: json['name'] as String,
      unit: json['unit'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$IngredientInputImplToJson(
        _$IngredientInputImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'unit': instance.unit,
      'amount': instance.amount,
    };
