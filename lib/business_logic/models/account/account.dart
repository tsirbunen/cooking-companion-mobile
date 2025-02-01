import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/business_logic/models/account/identity_provider.dart';

part 'account.freezed.dart';
part 'account.g.dart';

@freezed
class Account with _$Account {
  const factory Account({
    required int id,
    required String uuid,
    required String username,
    String? token,
    String? email,
    bool? emailVerified,
    required IdentityProvider identityProvider,
  }) = _Account;

  factory Account.fromJson(Map<String, Object?> json) =>
      _$AccountFromJson(json);
}
