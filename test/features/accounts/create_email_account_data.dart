import 'package:mobile/business_logic/models/account/account.dart';
import 'package:mobile/repositories/account/models/create_email_account_input/create_email_account_input.dart';

const username = 'username original';
const email = 'email';
const password = 'password';
const passwordConfirm = 'password';

final testAccountData = {
  "id": 1,
  "uuid": "38d80565-90b9-4cc7-bb51-3d53617cb410",
  "username": username,
  "email": email,
  "password": password,
  "identityProvider": "EMAIL",
};

final createEmailAccountInput = CreateEmailAccountInput(
  username: testAccountData["username"] as String,
  email: testAccountData["email"] as String,
  password: testAccountData["password"] as String,
);

final createEmailAccountTestData = {
  "createEmailAccount": {
    "__typename": "Account",
    "emailVerified": false,
    "id": testAccountData["id"],
    "identityProvider": testAccountData["identityProvider"],
    "uuid": testAccountData["uuid"],
    "username": testAccountData["username"],
    "email": testAccountData["email"],
    "password": testAccountData["password"],
  }
};

final emailAccount = Account.fromJson(
    createEmailAccountTestData["createEmailAccount"] as Map<String, dynamic>);
