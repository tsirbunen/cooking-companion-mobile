// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'json_schema.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

JsonSchema _$JsonSchemaFromJson(Map<String, dynamic> json) {
  return _JsonSchema.fromJson(json);
}

/// @nodoc
mixin _$JsonSchema {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  List<String> get required => throw _privateConstructorUsedError;
  Map<String, dynamic> get properties => throw _privateConstructorUsedError;
  Map<String, dynamic>? get errorMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JsonSchemaCopyWith<JsonSchema> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JsonSchemaCopyWith<$Res> {
  factory $JsonSchemaCopyWith(
          JsonSchema value, $Res Function(JsonSchema) then) =
      _$JsonSchemaCopyWithImpl<$Res, JsonSchema>;
  @useResult
  $Res call(
      {String title,
      String description,
      String type,
      List<String> required,
      Map<String, dynamic> properties,
      Map<String, dynamic>? errorMessage});
}

/// @nodoc
class _$JsonSchemaCopyWithImpl<$Res, $Val extends JsonSchema>
    implements $JsonSchemaCopyWith<$Res> {
  _$JsonSchemaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? required = null,
    Object? properties = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      required: null == required
          ? _value.required
          : required // ignore: cast_nullable_to_non_nullable
              as List<String>,
      properties: null == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JsonSchemaImplCopyWith<$Res>
    implements $JsonSchemaCopyWith<$Res> {
  factory _$$JsonSchemaImplCopyWith(
          _$JsonSchemaImpl value, $Res Function(_$JsonSchemaImpl) then) =
      __$$JsonSchemaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String description,
      String type,
      List<String> required,
      Map<String, dynamic> properties,
      Map<String, dynamic>? errorMessage});
}

/// @nodoc
class __$$JsonSchemaImplCopyWithImpl<$Res>
    extends _$JsonSchemaCopyWithImpl<$Res, _$JsonSchemaImpl>
    implements _$$JsonSchemaImplCopyWith<$Res> {
  __$$JsonSchemaImplCopyWithImpl(
      _$JsonSchemaImpl _value, $Res Function(_$JsonSchemaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? required = null,
    Object? properties = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$JsonSchemaImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      required: null == required
          ? _value._required
          : required // ignore: cast_nullable_to_non_nullable
              as List<String>,
      properties: null == properties
          ? _value._properties
          : properties // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      errorMessage: freezed == errorMessage
          ? _value._errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$JsonSchemaImpl implements _JsonSchema {
  const _$JsonSchemaImpl(
      {required this.title,
      required this.description,
      required this.type,
      required final List<String> required,
      required final Map<String, dynamic> properties,
      final Map<String, dynamic>? errorMessage})
      : _required = required,
        _properties = properties,
        _errorMessage = errorMessage;

  factory _$JsonSchemaImpl.fromJson(Map<String, dynamic> json) =>
      _$$JsonSchemaImplFromJson(json);

  @override
  final String title;
  @override
  final String description;
  @override
  final String type;
  final List<String> _required;
  @override
  List<String> get required {
    if (_required is EqualUnmodifiableListView) return _required;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_required);
  }

  final Map<String, dynamic> _properties;
  @override
  Map<String, dynamic> get properties {
    if (_properties is EqualUnmodifiableMapView) return _properties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_properties);
  }

  final Map<String, dynamic>? _errorMessage;
  @override
  Map<String, dynamic>? get errorMessage {
    final value = _errorMessage;
    if (value == null) return null;
    if (_errorMessage is EqualUnmodifiableMapView) return _errorMessage;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'JsonSchema(title: $title, description: $description, type: $type, required: $required, properties: $properties, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JsonSchemaImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._required, _required) &&
            const DeepCollectionEquality()
                .equals(other._properties, _properties) &&
            const DeepCollectionEquality()
                .equals(other._errorMessage, _errorMessage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      description,
      type,
      const DeepCollectionEquality().hash(_required),
      const DeepCollectionEquality().hash(_properties),
      const DeepCollectionEquality().hash(_errorMessage));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JsonSchemaImplCopyWith<_$JsonSchemaImpl> get copyWith =>
      __$$JsonSchemaImplCopyWithImpl<_$JsonSchemaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JsonSchemaImplToJson(
      this,
    );
  }
}

abstract class _JsonSchema implements JsonSchema {
  const factory _JsonSchema(
      {required final String title,
      required final String description,
      required final String type,
      required final List<String> required,
      required final Map<String, dynamic> properties,
      final Map<String, dynamic>? errorMessage}) = _$JsonSchemaImpl;

  factory _JsonSchema.fromJson(Map<String, dynamic> json) =
      _$JsonSchemaImpl.fromJson;

  @override
  String get title;
  @override
  String get description;
  @override
  String get type;
  @override
  List<String> get required;
  @override
  Map<String, dynamic> get properties;
  @override
  Map<String, dynamic>? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$JsonSchemaImplCopyWith<_$JsonSchemaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
