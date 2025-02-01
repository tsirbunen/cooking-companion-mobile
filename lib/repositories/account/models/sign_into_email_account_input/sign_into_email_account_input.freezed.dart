// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_into_email_account_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SignIntoEmailAccountInput _$SignIntoEmailAccountInputFromJson(
    Map<String, dynamic> json) {
  return _SignIntoEmailAccountInput.fromJson(json);
}

/// @nodoc
mixin _$SignIntoEmailAccountInput {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignIntoEmailAccountInputCopyWith<SignIntoEmailAccountInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignIntoEmailAccountInputCopyWith<$Res> {
  factory $SignIntoEmailAccountInputCopyWith(SignIntoEmailAccountInput value,
          $Res Function(SignIntoEmailAccountInput) then) =
      _$SignIntoEmailAccountInputCopyWithImpl<$Res, SignIntoEmailAccountInput>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$SignIntoEmailAccountInputCopyWithImpl<$Res,
        $Val extends SignIntoEmailAccountInput>
    implements $SignIntoEmailAccountInputCopyWith<$Res> {
  _$SignIntoEmailAccountInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignIntoEmailAccountInputImplCopyWith<$Res>
    implements $SignIntoEmailAccountInputCopyWith<$Res> {
  factory _$$SignIntoEmailAccountInputImplCopyWith(
          _$SignIntoEmailAccountInputImpl value,
          $Res Function(_$SignIntoEmailAccountInputImpl) then) =
      __$$SignIntoEmailAccountInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$SignIntoEmailAccountInputImplCopyWithImpl<$Res>
    extends _$SignIntoEmailAccountInputCopyWithImpl<$Res,
        _$SignIntoEmailAccountInputImpl>
    implements _$$SignIntoEmailAccountInputImplCopyWith<$Res> {
  __$$SignIntoEmailAccountInputImplCopyWithImpl(
      _$SignIntoEmailAccountInputImpl _value,
      $Res Function(_$SignIntoEmailAccountInputImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$SignIntoEmailAccountInputImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$SignIntoEmailAccountInputImpl implements _SignIntoEmailAccountInput {
  const _$SignIntoEmailAccountInputImpl(
      {required this.email, required this.password});

  factory _$SignIntoEmailAccountInputImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignIntoEmailAccountInputImplFromJson(json);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'SignIntoEmailAccountInput(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignIntoEmailAccountInputImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignIntoEmailAccountInputImplCopyWith<_$SignIntoEmailAccountInputImpl>
      get copyWith => __$$SignIntoEmailAccountInputImplCopyWithImpl<
          _$SignIntoEmailAccountInputImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignIntoEmailAccountInputImplToJson(
      this,
    );
  }
}

abstract class _SignIntoEmailAccountInput implements SignIntoEmailAccountInput {
  const factory _SignIntoEmailAccountInput(
      {required final String email,
      required final String password}) = _$SignIntoEmailAccountInputImpl;

  factory _SignIntoEmailAccountInput.fromJson(Map<String, dynamic> json) =
      _$SignIntoEmailAccountInputImpl.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$SignIntoEmailAccountInputImplCopyWith<_$SignIntoEmailAccountInputImpl>
      get copyWith => throw _privateConstructorUsedError;
}
