import 'package:mobile/repositories/account/models/delete_account_input/delete_account_input.dart';
import 'package:mobile/repositories/recipes/graph_ql/fragments.dart';
import 'package:mobile/repositories/common/graph_ql/graph_ql_mutation.dart';

class DeleteAccountMutation extends GraphQLMutation {
  final DeleteAccountInput input;

  DeleteAccountMutation(this.input) : super();

  @override
  String get name => 'deleteAccount';

  @override
  String get query => '''
        mutation DeleteAccount(\$deleteAccountInput: EmailInput!) {
            $name(deleteAccountInput: \$deleteAccountInput) {
              $generalResultFragment
            }
        }
    ''';

  @override
  Map<String, dynamic>? get variables => {'deleteAccountInput': input.toJson()};
}
