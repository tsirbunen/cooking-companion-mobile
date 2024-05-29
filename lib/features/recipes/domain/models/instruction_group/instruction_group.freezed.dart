// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'instruction_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InstructionGroup _$InstructionGroupFromJson(Map<String, dynamic> json) {
  return _InstructionGroup.fromJson(json);
}

/// @nodoc
mixin _$InstructionGroup {
  int get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  List<Instruction> get instructions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InstructionGroupCopyWith<InstructionGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstructionGroupCopyWith<$Res> {
  factory $InstructionGroupCopyWith(
          InstructionGroup value, $Res Function(InstructionGroup) then) =
      _$InstructionGroupCopyWithImpl<$Res, InstructionGroup>;
  @useResult
  $Res call({int id, String? title, List<Instruction> instructions});
}

/// @nodoc
class _$InstructionGroupCopyWithImpl<$Res, $Val extends InstructionGroup>
    implements $InstructionGroupCopyWith<$Res> {
  _$InstructionGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? instructions = null,
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
      instructions: null == instructions
          ? _value.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as List<Instruction>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InstructionGroupImplCopyWith<$Res>
    implements $InstructionGroupCopyWith<$Res> {
  factory _$$InstructionGroupImplCopyWith(_$InstructionGroupImpl value,
          $Res Function(_$InstructionGroupImpl) then) =
      __$$InstructionGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String? title, List<Instruction> instructions});
}

/// @nodoc
class __$$InstructionGroupImplCopyWithImpl<$Res>
    extends _$InstructionGroupCopyWithImpl<$Res, _$InstructionGroupImpl>
    implements _$$InstructionGroupImplCopyWith<$Res> {
  __$$InstructionGroupImplCopyWithImpl(_$InstructionGroupImpl _value,
      $Res Function(_$InstructionGroupImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? instructions = null,
  }) {
    return _then(_$InstructionGroupImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      instructions: null == instructions
          ? _value._instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as List<Instruction>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InstructionGroupImpl implements _InstructionGroup {
  const _$InstructionGroupImpl(
      {required this.id,
      this.title,
      required final List<Instruction> instructions})
      : _instructions = instructions;

  factory _$InstructionGroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$InstructionGroupImplFromJson(json);

  @override
  final int id;
  @override
  final String? title;
  final List<Instruction> _instructions;
  @override
  List<Instruction> get instructions {
    if (_instructions is EqualUnmodifiableListView) return _instructions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_instructions);
  }

  @override
  String toString() {
    return 'InstructionGroup(id: $id, title: $title, instructions: $instructions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InstructionGroupImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality()
                .equals(other._instructions, _instructions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title,
      const DeepCollectionEquality().hash(_instructions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InstructionGroupImplCopyWith<_$InstructionGroupImpl> get copyWith =>
      __$$InstructionGroupImplCopyWithImpl<_$InstructionGroupImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InstructionGroupImplToJson(
      this,
    );
  }
}

abstract class _InstructionGroup implements InstructionGroup {
  const factory _InstructionGroup(
      {required final int id,
      final String? title,
      required final List<Instruction> instructions}) = _$InstructionGroupImpl;

  factory _InstructionGroup.fromJson(Map<String, dynamic> json) =
      _$InstructionGroupImpl.fromJson;

  @override
  int get id;
  @override
  String? get title;
  @override
  List<Instruction> get instructions;
  @override
  @JsonKey(ignore: true)
  _$$InstructionGroupImplCopyWith<_$InstructionGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
