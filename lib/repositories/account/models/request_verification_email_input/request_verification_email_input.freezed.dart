// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_verification_email_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RequestVerificationEmailInput _$RequestVerificationEmailInputFromJson(
    Map<String, dynamic> json) {
  return _RequestVerificationEmailInput.fromJson(json);
}

/// @nodoc
mixin _$RequestVerificationEmailInput {
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestVerificationEmailInputCopyWith<RequestVerificationEmailInput>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestVerificationEmailInputCopyWith<$Res> {
  factory $RequestVerificationEmailInputCopyWith(
          RequestVerificationEmailInput value,
          $Res Function(RequestVerificationEmailInput) then) =
      _$RequestVerificationEmailInputCopyWithImpl<$Res,
          RequestVerificationEmailInput>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$RequestVerificationEmailInputCopyWithImpl<$Res,
        $Val extends RequestVerificationEmailInput>
    implements $RequestVerificationEmailInputCopyWith<$Res> {
  _$RequestVerificationEmailInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestVerificationEmailInputImplCopyWith<$Res>
    implements $RequestVerificationEmailInputCopyWith<$Res> {
  factory _$$RequestVerificationEmailInputImplCopyWith(
          _$RequestVerificationEmailInputImpl value,
          $Res Function(_$RequestVerificationEmailInputImpl) then) =
      __$$RequestVerificationEmailInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$RequestVerificationEmailInputImplCopyWithImpl<$Res>
    extends _$RequestVerificationEmailInputCopyWithImpl<$Res,
        _$RequestVerificationEmailInputImpl>
    implements _$$RequestVerificationEmailInputImplCopyWith<$Res> {
  __$$RequestVerificationEmailInputImplCopyWithImpl(
      _$RequestVerificationEmailInputImpl _value,
      $Res Function(_$RequestVerificationEmailInputImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$RequestVerificationEmailInputImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$RequestVerificationEmailInputImpl
    implements _RequestVerificationEmailInput {
  const _$RequestVerificationEmailInputImpl({required this.email});

  factory _$RequestVerificationEmailInputImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RequestVerificationEmailInputImplFromJson(json);

  @override
  final String email;

  @override
  String toString() {
    return 'RequestVerificationEmailInput(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestVerificationEmailInputImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestVerificationEmailInputImplCopyWith<
          _$RequestVerificationEmailInputImpl>
      get copyWith => __$$RequestVerificationEmailInputImplCopyWithImpl<
          _$RequestVerificationEmailInputImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestVerificationEmailInputImplToJson(
      this,
    );
  }
}

abstract class _RequestVerificationEmailInput
    implements RequestVerificationEmailInput {
  const factory _RequestVerificationEmailInput({required final String email}) =
      _$RequestVerificationEmailInputImpl;

  factory _RequestVerificationEmailInput.fromJson(Map<String, dynamic> json) =
      _$RequestVerificationEmailInputImpl.fromJson;

  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$RequestVerificationEmailInputImplCopyWith<
          _$RequestVerificationEmailInputImpl>
      get copyWith => throw _privateConstructorUsedError;
}
