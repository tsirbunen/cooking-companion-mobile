// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Recipe _$RecipeFromJson(Map<String, dynamic> json) {
  return _Recipe.fromJson(json);
}

/// @nodoc
mixin _$Recipe {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  Language get language => throw _privateConstructorUsedError;
  bool get ovenNeeded => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<Photo>? get photos => throw _privateConstructorUsedError;
  List<Tag>? get tags => throw _privateConstructorUsedError;
  List<IngredientGroup> get ingredientGroups =>
      throw _privateConstructorUsedError;
  List<InstructionGroup> get instructionGroups =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipeCopyWith<Recipe> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeCopyWith<$Res> {
  factory $RecipeCopyWith(Recipe value, $Res Function(Recipe) then) =
      _$RecipeCopyWithImpl<$Res, Recipe>;
  @useResult
  $Res call(
      {int id,
      String title,
      Language language,
      bool ovenNeeded,
      String? description,
      List<Photo>? photos,
      List<Tag>? tags,
      List<IngredientGroup> ingredientGroups,
      List<InstructionGroup> instructionGroups});

  $LanguageCopyWith<$Res> get language;
}

/// @nodoc
class _$RecipeCopyWithImpl<$Res, $Val extends Recipe>
    implements $RecipeCopyWith<$Res> {
  _$RecipeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? language = null,
    Object? ovenNeeded = null,
    Object? description = freezed,
    Object? photos = freezed,
    Object? tags = freezed,
    Object? ingredientGroups = null,
    Object? instructionGroups = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as Language,
      ovenNeeded: null == ovenNeeded
          ? _value.ovenNeeded
          : ovenNeeded // ignore: cast_nullable_to_non_nullable
              as bool,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      photos: freezed == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<Photo>?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>?,
      ingredientGroups: null == ingredientGroups
          ? _value.ingredientGroups
          : ingredientGroups // ignore: cast_nullable_to_non_nullable
              as List<IngredientGroup>,
      instructionGroups: null == instructionGroups
          ? _value.instructionGroups
          : instructionGroups // ignore: cast_nullable_to_non_nullable
              as List<InstructionGroup>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LanguageCopyWith<$Res> get language {
    return $LanguageCopyWith<$Res>(_value.language, (value) {
      return _then(_value.copyWith(language: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RecipeImplCopyWith<$Res> implements $RecipeCopyWith<$Res> {
  factory _$$RecipeImplCopyWith(
          _$RecipeImpl value, $Res Function(_$RecipeImpl) then) =
      __$$RecipeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      Language language,
      bool ovenNeeded,
      String? description,
      List<Photo>? photos,
      List<Tag>? tags,
      List<IngredientGroup> ingredientGroups,
      List<InstructionGroup> instructionGroups});

  @override
  $LanguageCopyWith<$Res> get language;
}

/// @nodoc
class __$$RecipeImplCopyWithImpl<$Res>
    extends _$RecipeCopyWithImpl<$Res, _$RecipeImpl>
    implements _$$RecipeImplCopyWith<$Res> {
  __$$RecipeImplCopyWithImpl(
      _$RecipeImpl _value, $Res Function(_$RecipeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? language = null,
    Object? ovenNeeded = null,
    Object? description = freezed,
    Object? photos = freezed,
    Object? tags = freezed,
    Object? ingredientGroups = null,
    Object? instructionGroups = null,
  }) {
    return _then(_$RecipeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as Language,
      ovenNeeded: null == ovenNeeded
          ? _value.ovenNeeded
          : ovenNeeded // ignore: cast_nullable_to_non_nullable
              as bool,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      photos: freezed == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<Photo>?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>?,
      ingredientGroups: null == ingredientGroups
          ? _value._ingredientGroups
          : ingredientGroups // ignore: cast_nullable_to_non_nullable
              as List<IngredientGroup>,
      instructionGroups: null == instructionGroups
          ? _value._instructionGroups
          : instructionGroups // ignore: cast_nullable_to_non_nullable
              as List<InstructionGroup>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecipeImpl implements _Recipe {
  const _$RecipeImpl(
      {required this.id,
      required this.title,
      required this.language,
      required this.ovenNeeded,
      this.description,
      final List<Photo>? photos,
      final List<Tag>? tags,
      required final List<IngredientGroup> ingredientGroups,
      required final List<InstructionGroup> instructionGroups})
      : _photos = photos,
        _tags = tags,
        _ingredientGroups = ingredientGroups,
        _instructionGroups = instructionGroups;

  factory _$RecipeImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipeImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final Language language;
  @override
  final bool ovenNeeded;
  @override
  final String? description;
  final List<Photo>? _photos;
  @override
  List<Photo>? get photos {
    final value = _photos;
    if (value == null) return null;
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Tag>? _tags;
  @override
  List<Tag>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<IngredientGroup> _ingredientGroups;
  @override
  List<IngredientGroup> get ingredientGroups {
    if (_ingredientGroups is EqualUnmodifiableListView)
      return _ingredientGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredientGroups);
  }

  final List<InstructionGroup> _instructionGroups;
  @override
  List<InstructionGroup> get instructionGroups {
    if (_instructionGroups is EqualUnmodifiableListView)
      return _instructionGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_instructionGroups);
  }

  @override
  String toString() {
    return 'Recipe(id: $id, title: $title, language: $language, ovenNeeded: $ovenNeeded, description: $description, photos: $photos, tags: $tags, ingredientGroups: $ingredientGroups, instructionGroups: $instructionGroups)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.ovenNeeded, ovenNeeded) ||
                other.ovenNeeded == ovenNeeded) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._photos, _photos) &&
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
      id,
      title,
      language,
      ovenNeeded,
      description,
      const DeepCollectionEquality().hash(_photos),
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_ingredientGroups),
      const DeepCollectionEquality().hash(_instructionGroups));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeImplCopyWith<_$RecipeImpl> get copyWith =>
      __$$RecipeImplCopyWithImpl<_$RecipeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipeImplToJson(
      this,
    );
  }
}

abstract class _Recipe implements Recipe {
  const factory _Recipe(
      {required final int id,
      required final String title,
      required final Language language,
      required final bool ovenNeeded,
      final String? description,
      final List<Photo>? photos,
      final List<Tag>? tags,
      required final List<IngredientGroup> ingredientGroups,
      required final List<InstructionGroup> instructionGroups}) = _$RecipeImpl;

  factory _Recipe.fromJson(Map<String, dynamic> json) = _$RecipeImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  Language get language;
  @override
  bool get ovenNeeded;
  @override
  String? get description;
  @override
  List<Photo>? get photos;
  @override
  List<Tag>? get tags;
  @override
  List<IngredientGroup> get ingredientGroups;
  @override
  List<InstructionGroup> get instructionGroups;
  @override
  @JsonKey(ignore: true)
  _$$RecipeImplCopyWith<_$RecipeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
