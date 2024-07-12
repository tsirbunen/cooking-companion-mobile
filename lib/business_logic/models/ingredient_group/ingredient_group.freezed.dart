// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingredient_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IngredientGroup _$IngredientGroupFromJson(Map<String, dynamic> json) {
  return _IngredientGroup.fromJson(json);
}

/// @nodoc
mixin _$IngredientGroup {
  int get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  List<Ingredient> get ingredients => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IngredientGroupCopyWith<IngredientGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientGroupCopyWith<$Res> {
  factory $IngredientGroupCopyWith(
          IngredientGroup value, $Res Function(IngredientGroup) then) =
      _$IngredientGroupCopyWithImpl<$Res, IngredientGroup>;
  @useResult
  $Res call({int id, String? title, List<Ingredient> ingredients});
}

/// @nodoc
class _$IngredientGroupCopyWithImpl<$Res, $Val extends IngredientGroup>
    implements $IngredientGroupCopyWith<$Res> {
  _$IngredientGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? ingredients = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IngredientGroupImplCopyWith<$Res>
    implements $IngredientGroupCopyWith<$Res> {
  factory _$$IngredientGroupImplCopyWith(_$IngredientGroupImpl value,
          $Res Function(_$IngredientGroupImpl) then) =
      __$$IngredientGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String? title, List<Ingredient> ingredients});
}

/// @nodoc
class __$$IngredientGroupImplCopyWithImpl<$Res>
    extends _$IngredientGroupCopyWithImpl<$Res, _$IngredientGroupImpl>
    implements _$$IngredientGroupImplCopyWith<$Res> {
  __$$IngredientGroupImplCopyWithImpl(
      _$IngredientGroupImpl _value, $Res Function(_$IngredientGroupImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? ingredients = null,
  }) {
    return _then(_$IngredientGroupImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      ingredients: null == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$IngredientGroupImpl implements _IngredientGroup {
  const _$IngredientGroupImpl(
      {required this.id,
      this.title,
      required final List<Ingredient> ingredients})
      : _ingredients = ingredients;

  factory _$IngredientGroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$IngredientGroupImplFromJson(json);

  @override
  final int id;
  @override
  final String? title;
  final List<Ingredient> _ingredients;
  @override
  List<Ingredient> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  @override
  String toString() {
    return 'IngredientGroup(id: $id, title: $title, ingredients: $ingredients)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IngredientGroupImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title,
      const DeepCollectionEquality().hash(_ingredients));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IngredientGroupImplCopyWith<_$IngredientGroupImpl> get copyWith =>
      __$$IngredientGroupImplCopyWithImpl<_$IngredientGroupImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IngredientGroupImplToJson(
      this,
    );
  }
}

abstract class _IngredientGroup implements IngredientGroup {
  const factory _IngredientGroup(
      {required final int id,
      final String? title,
      required final List<Ingredient> ingredients}) = _$IngredientGroupImpl;

  factory _IngredientGroup.fromJson(Map<String, dynamic> json) =
      _$IngredientGroupImpl.fromJson;

  @override
  int get id;
  @override
  String? get title;
  @override
  List<Ingredient> get ingredients;
  @override
  @JsonKey(ignore: true)
  _$$IngredientGroupImplCopyWith<_$IngredientGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
