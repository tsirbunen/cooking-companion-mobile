import 'package:mobile/repositories/account/graph_ql/fragments.dart';
import 'package:mobile/repositories/account/models/create_email_account_input/create_email_account_input.dart';
import 'package:mobile/repositories/common/graph_ql/graph_ql_mutation.dart';

class CreateEmailAccountMutation extends GraphQLMutation {
  final CreateEmailAccountInput input;

  CreateEmailAccountMutation(this.input) : super();

  @override
  String get name => 'createEmailAccount';

  @override
  String get query => '''
        mutation CreateEmailAccount(\$emailAccountInput: EmailAccountInput!) {
            $name(emailAccountInput: \$emailAccountInput) {
              $accountResultFragment
            }
        }
    ''';

  @override
  Map<String, dynamic>? get variables => {'emailAccountInput': input.toJson()};
}
