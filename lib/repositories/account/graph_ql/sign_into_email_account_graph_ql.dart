import 'package:mobile/repositories/account/graph_ql/fragments.dart';
import 'package:mobile/repositories/common/graph_ql/graph_ql_mutation.dart';
import 'package:mobile/repositories/account/models/sign_into_email_account_input/sign_into_email_account_input.dart';

class SignIntoEmailAccountMutation extends GraphQLMutation {
  final SignIntoEmailAccountInput input;

  SignIntoEmailAccountMutation(this.input) : super();

  @override
  String get name => 'signInToEmailAccount';

  @override
  String get query => '''
        mutation SignInToEmailAccountInput(\$signInToEmailAccountInput: SignInToEmailAccountInput!) {
            $name(signInToEmailAccountInput: \$signInToEmailAccountInput) {
              $accountResultFragment
            }
        }
    ''';

  @override
  Map<String, dynamic>? get variables =>
      {'signInToEmailAccountInput': input.toJson()};
}
