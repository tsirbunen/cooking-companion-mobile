// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingredient_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IngredientInput _$IngredientInputFromJson(Map<String, dynamic> json) {
  return _IngredientInput.fromJson(json);
}

/// @nodoc
mixin _$IngredientInput {
  String get name => throw _privateConstructorUsedError;
  String? get unit => throw _privateConstructorUsedError;
  double? get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IngredientInputCopyWith<IngredientInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientInputCopyWith<$Res> {
  factory $IngredientInputCopyWith(
          IngredientInput value, $Res Function(IngredientInput) then) =
      _$IngredientInputCopyWithImpl<$Res, IngredientInput>;
  @useResult
  $Res call({String name, String? unit, double? amount});
}

/// @nodoc
class _$IngredientInputCopyWithImpl<$Res, $Val extends IngredientInput>
    implements $IngredientInputCopyWith<$Res> {
  _$IngredientInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? unit = freezed,
    Object? amount = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IngredientInputImplCopyWith<$Res>
    implements $IngredientInputCopyWith<$Res> {
  factory _$$IngredientInputImplCopyWith(_$IngredientInputImpl value,
          $Res Function(_$IngredientInputImpl) then) =
      __$$IngredientInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String? unit, double? amount});
}

/// @nodoc
class __$$IngredientInputImplCopyWithImpl<$Res>
    extends _$IngredientInputCopyWithImpl<$Res, _$IngredientInputImpl>
    implements _$$IngredientInputImplCopyWith<$Res> {
  __$$IngredientInputImplCopyWithImpl(
      _$IngredientInputImpl _value, $Res Function(_$IngredientInputImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? unit = freezed,
    Object? amount = freezed,
  }) {
    return _then(_$IngredientInputImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$IngredientInputImpl implements _IngredientInput {
  const _$IngredientInputImpl({required this.name, this.unit, this.amount});

  factory _$IngredientInputImpl.fromJson(Map<String, dynamic> json) =>
      _$$IngredientInputImplFromJson(json);

  @override
  final String name;
  @override
  final String? unit;
  @override
  final double? amount;

  @override
  String toString() {
    return 'IngredientInput(name: $name, unit: $unit, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IngredientInputImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, unit, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IngredientInputImplCopyWith<_$IngredientInputImpl> get copyWith =>
      __$$IngredientInputImplCopyWithImpl<_$IngredientInputImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IngredientInputImplToJson(
      this,
    );
  }
}

abstract class _IngredientInput implements IngredientInput {
  const factory _IngredientInput(
      {required final String name,
      final String? unit,
      final double? amount}) = _$IngredientInputImpl;

  factory _IngredientInput.fromJson(Map<String, dynamic> json) =
      _$IngredientInputImpl.fromJson;

  @override
  String get name;
  @override
  String? get unit;
  @override
  double? get amount;
  @override
  @JsonKey(ignore: true)
  _$$IngredientInputImplCopyWith<_$IngredientInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
