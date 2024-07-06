// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingredient_group_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IngredientGroupInput _$IngredientGroupInputFromJson(Map<String, dynamic> json) {
  return _IngredientGroupInput.fromJson(json);
}

/// @nodoc
mixin _$IngredientGroupInput {
  String? get title => throw _privateConstructorUsedError;
  List<IngredientInput> get ingredients => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IngredientGroupInputCopyWith<IngredientGroupInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientGroupInputCopyWith<$Res> {
  factory $IngredientGroupInputCopyWith(IngredientGroupInput value,
          $Res Function(IngredientGroupInput) then) =
      _$IngredientGroupInputCopyWithImpl<$Res, IngredientGroupInput>;
  @useResult
  $Res call({String? title, List<IngredientInput> ingredients});
}

/// @nodoc
class _$IngredientGroupInputCopyWithImpl<$Res,
        $Val extends IngredientGroupInput>
    implements $IngredientGroupInputCopyWith<$Res> {
  _$IngredientGroupInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? ingredients = null,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<IngredientInput>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IngredientGroupInputImplCopyWith<$Res>
    implements $IngredientGroupInputCopyWith<$Res> {
  factory _$$IngredientGroupInputImplCopyWith(_$IngredientGroupInputImpl value,
          $Res Function(_$IngredientGroupInputImpl) then) =
      __$$IngredientGroupInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title, List<IngredientInput> ingredients});
}

/// @nodoc
class __$$IngredientGroupInputImplCopyWithImpl<$Res>
    extends _$IngredientGroupInputCopyWithImpl<$Res, _$IngredientGroupInputImpl>
    implements _$$IngredientGroupInputImplCopyWith<$Res> {
  __$$IngredientGroupInputImplCopyWithImpl(_$IngredientGroupInputImpl _value,
      $Res Function(_$IngredientGroupInputImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? ingredients = null,
  }) {
    return _then(_$IngredientGroupInputImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      ingredients: null == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<IngredientInput>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$IngredientGroupInputImpl implements _IngredientGroupInput {
  const _$IngredientGroupInputImpl(
      {this.title, required final List<IngredientInput> ingredients})
      : _ingredients = ingredients;

  factory _$IngredientGroupInputImpl.fromJson(Map<String, dynamic> json) =>
      _$$IngredientGroupInputImplFromJson(json);

  @override
  final String? title;
  final List<IngredientInput> _ingredients;
  @override
  List<IngredientInput> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  @override
  String toString() {
    return 'IngredientGroupInput(title: $title, ingredients: $ingredients)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IngredientGroupInputImpl &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, const DeepCollectionEquality().hash(_ingredients));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IngredientGroupInputImplCopyWith<_$IngredientGroupInputImpl>
      get copyWith =>
          __$$IngredientGroupInputImplCopyWithImpl<_$IngredientGroupInputImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IngredientGroupInputImplToJson(
      this,
    );
  }
}

abstract class _IngredientGroupInput implements IngredientGroupInput {
  const factory _IngredientGroupInput(
          {final String? title,
          required final List<IngredientInput> ingredients}) =
      _$IngredientGroupInputImpl;

  factory _IngredientGroupInput.fromJson(Map<String, dynamic> json) =
      _$IngredientGroupInputImpl.fromJson;

  @override
  String? get title;
  @override
  List<IngredientInput> get ingredients;
  @override
  @JsonKey(ignore: true)
  _$$IngredientGroupInputImplCopyWith<_$IngredientGroupInputImpl>
      get copyWith => throw _privateConstructorUsedError;
}
