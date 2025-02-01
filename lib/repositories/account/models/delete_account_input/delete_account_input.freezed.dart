// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_account_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeleteAccountInput _$DeleteAccountInputFromJson(Map<String, dynamic> json) {
  return _DeleteAccountInput.fromJson(json);
}

/// @nodoc
mixin _$DeleteAccountInput {
  int get id => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeleteAccountInputCopyWith<DeleteAccountInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteAccountInputCopyWith<$Res> {
  factory $DeleteAccountInputCopyWith(
          DeleteAccountInput value, $Res Function(DeleteAccountInput) then) =
      _$DeleteAccountInputCopyWithImpl<$Res, DeleteAccountInput>;
  @useResult
  $Res call({int id, String uuid});
}

/// @nodoc
class _$DeleteAccountInputCopyWithImpl<$Res, $Val extends DeleteAccountInput>
    implements $DeleteAccountInputCopyWith<$Res> {
  _$DeleteAccountInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uuid = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeleteAccountInputImplCopyWith<$Res>
    implements $DeleteAccountInputCopyWith<$Res> {
  factory _$$DeleteAccountInputImplCopyWith(_$DeleteAccountInputImpl value,
          $Res Function(_$DeleteAccountInputImpl) then) =
      __$$DeleteAccountInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String uuid});
}

/// @nodoc
class __$$DeleteAccountInputImplCopyWithImpl<$Res>
    extends _$DeleteAccountInputCopyWithImpl<$Res, _$DeleteAccountInputImpl>
    implements _$$DeleteAccountInputImplCopyWith<$Res> {
  __$$DeleteAccountInputImplCopyWithImpl(_$DeleteAccountInputImpl _value,
      $Res Function(_$DeleteAccountInputImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uuid = null,
  }) {
    return _then(_$DeleteAccountInputImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$DeleteAccountInputImpl implements _DeleteAccountInput {
  const _$DeleteAccountInputImpl({required this.id, required this.uuid});

  factory _$DeleteAccountInputImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeleteAccountInputImplFromJson(json);

  @override
  final int id;
  @override
  final String uuid;

  @override
  String toString() {
    return 'DeleteAccountInput(id: $id, uuid: $uuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteAccountInputImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uuid, uuid) || other.uuid == uuid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, uuid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteAccountInputImplCopyWith<_$DeleteAccountInputImpl> get copyWith =>
      __$$DeleteAccountInputImplCopyWithImpl<_$DeleteAccountInputImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeleteAccountInputImplToJson(
      this,
    );
  }
}

abstract class _DeleteAccountInput implements DeleteAccountInput {
  const factory _DeleteAccountInput(
      {required final int id,
      required final String uuid}) = _$DeleteAccountInputImpl;

  factory _DeleteAccountInput.fromJson(Map<String, dynamic> json) =
      _$DeleteAccountInputImpl.fromJson;

  @override
  int get id;
  @override
  String get uuid;
  @override
  @JsonKey(ignore: true)
  _$$DeleteAccountInputImplCopyWith<_$DeleteAccountInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
