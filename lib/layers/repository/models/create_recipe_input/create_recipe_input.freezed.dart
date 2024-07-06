// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_recipe_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateRecipeInput _$CreateRecipeInputFromJson(Map<String, dynamic> json) {
  return _CreateRecipeInput.fromJson(json);
}

/// @nodoc
mixin _$CreateRecipeInput {
  String get title => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  bool get ovenNeeded => throw _privateConstructorUsedError;
  String? get description =>
      throw _privateConstructorUsedError; // List<String>? photos,
  List<String>? get tags => throw _privateConstructorUsedError;
  List<IngredientGroupInput> get ingredientGroups =>
      throw _privateConstructorUsedError;
  List<InstructionGroupInput> get instructionGroups =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateRecipeInputCopyWith<CreateRecipeInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateRecipeInputCopyWith<$Res> {
  factory $CreateRecipeInputCopyWith(
          CreateRecipeInput value, $Res Function(CreateRecipeInput) then) =
      _$CreateRecipeInputCopyWithImpl<$Res, CreateRecipeInput>;
  @useResult
  $Res call(
      {String title,
      String language,
      bool ovenNeeded,
      String? description,
      List<String>? tags,
      List<IngredientGroupInput> ingredientGroups,
      List<InstructionGroupInput> instructionGroups});
}

/// @nodoc
class _$CreateRecipeInputCopyWithImpl<$Res, $Val extends CreateRecipeInput>
    implements $CreateRecipeInputCopyWith<$Res> {
  _$CreateRecipeInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? language = null,
    Object? ovenNeeded = null,
    Object? description = freezed,
    Object? tags = freezed,
    Object? ingredientGroups = null,
    Object? instructionGroups = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      ovenNeeded: null == ovenNeeded
          ? _value.ovenNeeded
          : ovenNeeded // ignore: cast_nullable_to_non_nullable
              as bool,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      ingredientGroups: null == ingredientGroups
          ? _value.ingredientGroups
          : ingredientGroups // ignore: cast_nullable_to_non_nullable
              as List<IngredientGroupInput>,
      instructionGroups: null == instructionGroups
          ? _value.instructionGroups
          : instructionGroups // ignore: cast_nullable_to_non_nullable
              as List<InstructionGroupInput>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateRecipeInputImplCopyWith<$Res>
    implements $CreateRecipeInputCopyWith<$Res> {
  factory _$$CreateRecipeInputImplCopyWith(_$CreateRecipeInputImpl value,
          $Res Function(_$CreateRecipeInputImpl) then) =
      __$$CreateRecipeInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String language,
      bool ovenNeeded,
      String? description,
      List<String>? tags,
      List<IngredientGroupInput> ingredientGroups,
      List<InstructionGroupInput> instructionGroups});
}

/// @nodoc
class __$$CreateRecipeInputImplCopyWithImpl<$Res>
    extends _$CreateRecipeInputCopyWithImpl<$Res, _$CreateRecipeInputImpl>
    implements _$$CreateRecipeInputImplCopyWith<$Res> {
  __$$CreateRecipeInputImplCopyWithImpl(_$CreateRecipeInputImpl _value,
      $Res Function(_$CreateRecipeInputImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? language = null,
    Object? ovenNeeded = null,
    Object? description = freezed,
    Object? tags = freezed,
    Object? ingredientGroups = null,
    Object? instructionGroups = null,
  }) {
    return _then(_$CreateRecipeInputImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      ovenNeeded: null == ovenNeeded
          ? _value.ovenNeeded
          : ovenNeeded // ignore: cast_nullable_to_non_nullable
              as bool,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      ingredientGroups: null == ingredientGroups
          ? _value._ingredientGroups
          : ingredientGroups // ignore: cast_nullable_to_non_nullable
              as List<IngredientGroupInput>,
      instructionGroups: null == instructionGroups
          ? _value._instructionGroups
          : instructionGroups // ignore: cast_nullable_to_non_nullable
              as List<InstructionGroupInput>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$CreateRecipeInputImpl implements _CreateRecipeInput {
  const _$CreateRecipeInputImpl(
      {required this.title,
      required this.language,
      required this.ovenNeeded,
      this.description,
      final List<String>? tags,
      required final List<IngredientGroupInput> ingredientGroups,
      required final List<InstructionGroupInput> instructionGroups})
      : _tags = tags,
        _ingredientGroups = ingredientGroups,
        _instructionGroups = instructionGroups;

  factory _$CreateRecipeInputImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateRecipeInputImplFromJson(json);

  @override
  final String title;
  @override
  final String language;
  @override
  final bool ovenNeeded;
  @override
  final String? description;
// List<String>? photos,
  final List<String>? _tags;
// List<String>? photos,
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<IngredientGroupInput> _ingredientGroups;
  @override
  List<IngredientGroupInput> get ingredientGroups {
    if (_ingredientGroups is EqualUnmodifiableListView)
      return _ingredientGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredientGroups);
  }

  final List<InstructionGroupInput> _instructionGroups;
  @override
  List<InstructionGroupInput> get instructionGroups {
    if (_instructionGroups is EqualUnmodifiableListView)
      return _instructionGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_instructionGroups);
  }

  @override
  String toString() {
    return 'CreateRecipeInput(title: $title, language: $language, ovenNeeded: $ovenNeeded, description: $description, tags: $tags, ingredientGroups: $ingredientGroups, instructionGroups: $instructionGroups)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateRecipeInputImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.ovenNeeded, ovenNeeded) ||
                other.ovenNeeded == ovenNeeded) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality()
                .equals(other._ingredientGroups, _ingredientGroups) &&
            const DeepCollectionEquality()
                .equals(other._instructionGroups, _instructionGroups));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      language,
      ovenNeeded,
      description,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_ingredientGroups),
      const DeepCollectionEquality().hash(_instructionGroups));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateRecipeInputImplCopyWith<_$CreateRecipeInputImpl> get copyWith =>
      __$$CreateRecipeInputImplCopyWithImpl<_$CreateRecipeInputImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateRecipeInputImplToJson(
      this,
    );
  }
}

abstract class _CreateRecipeInput implements CreateRecipeInput {
  const factory _CreateRecipeInput(
          {required final String title,
          required final String language,
          required final bool ovenNeeded,
          final String? description,
          final List<String>? tags,
          required final List<IngredientGroupInput> ingredientGroups,
          required final List<InstructionGroupInput> instructionGroups}) =
      _$CreateRecipeInputImpl;

  factory _CreateRecipeInput.fromJson(Map<String, dynamic> json) =
      _$CreateRecipeInputImpl.fromJson;

  @override
  String get title;
  @override
  String get language;
  @override
  bool get ovenNeeded;
  @override
  String? get description;
  @override // List<String>? photos,
  List<String>? get tags;
  @override
  List<IngredientGroupInput> get ingredientGroups;
  @override
  List<InstructionGroupInput> get instructionGroups;
  @override
  @JsonKey(ignore: true)
  _$$CreateRecipeInputImplCopyWith<_$CreateRecipeInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
