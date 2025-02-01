// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'instruction_group_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InstructionGroupInput _$InstructionGroupInputFromJson(
    Map<String, dynamic> json) {
  return _InstructionGroupInput.fromJson(json);
}

/// @nodoc
mixin _$InstructionGroupInput {
  String? get title => throw _privateConstructorUsedError;
  List<String>? get instructions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InstructionGroupInputCopyWith<InstructionGroupInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstructionGroupInputCopyWith<$Res> {
  factory $InstructionGroupInputCopyWith(InstructionGroupInput value,
          $Res Function(InstructionGroupInput) then) =
      _$InstructionGroupInputCopyWithImpl<$Res, InstructionGroupInput>;
  @useResult
  $Res call({String? title, List<String>? instructions});
}

/// @nodoc
class _$InstructionGroupInputCopyWithImpl<$Res,
        $Val extends InstructionGroupInput>
    implements $InstructionGroupInputCopyWith<$Res> {
  _$InstructionGroupInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? instructions = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      instructions: freezed == instructions
          ? _value.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InstructionGroupInputImplCopyWith<$Res>
    implements $InstructionGroupInputCopyWith<$Res> {
  factory _$$InstructionGroupInputImplCopyWith(
          _$InstructionGroupInputImpl value,
          $Res Function(_$InstructionGroupInputImpl) then) =
      __$$InstructionGroupInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title, List<String>? instructions});
}

/// @nodoc
class __$$InstructionGroupInputImplCopyWithImpl<$Res>
    extends _$InstructionGroupInputCopyWithImpl<$Res,
        _$InstructionGroupInputImpl>
    implements _$$InstructionGroupInputImplCopyWith<$Res> {
  __$$InstructionGroupInputImplCopyWithImpl(_$InstructionGroupInputImpl _value,
      $Res Function(_$InstructionGroupInputImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? instructions = freezed,
  }) {
    return _then(_$InstructionGroupInputImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      instructions: freezed == instructions
          ? _value._instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$InstructionGroupInputImpl implements _InstructionGroupInput {
  const _$InstructionGroupInputImpl(
      {this.title, required final List<String>? instructions})
      : _instructions = instructions;

  factory _$InstructionGroupInputImpl.fromJson(Map<String, dynamic> json) =>
      _$$InstructionGroupInputImplFromJson(json);

  @override
  final String? title;
  final List<String>? _instructions;
  @override
  List<String>? get instructions {
    final value = _instructions;
    if (value == null) return null;
    if (_instructions is EqualUnmodifiableListView) return _instructions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'InstructionGroupInput(title: $title, instructions: $instructions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InstructionGroupInputImpl &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality()
                .equals(other._instructions, _instructions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, const DeepCollectionEquality().hash(_instructions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InstructionGroupInputImplCopyWith<_$InstructionGroupInputImpl>
      get copyWith => __$$InstructionGroupInputImplCopyWithImpl<
          _$InstructionGroupInputImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InstructionGroupInputImplToJson(
      this,
    );
  }
}

abstract class _InstructionGroupInput implements InstructionGroupInput {
  const factory _InstructionGroupInput(
      {final String? title,
      required final List<String>? instructions}) = _$InstructionGroupInputImpl;

  factory _InstructionGroupInput.fromJson(Map<String, dynamic> json) =
      _$InstructionGroupInputImpl.fromJson;

  @override
  String? get title;
  @override
  List<String>? get instructions;
  @override
  @JsonKey(ignore: true)
  _$$InstructionGroupInputImplCopyWith<_$InstructionGroupInputImpl>
      get copyWith => throw _privateConstructorUsedError;
}
