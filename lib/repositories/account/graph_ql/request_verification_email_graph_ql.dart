import 'package:mobile/repositories/recipes/graph_ql/fragments.dart';
import 'package:mobile/repositories/common/graph_ql/graph_ql_mutation.dart';
import 'package:mobile/repositories/account/models/request_verification_email_input/request_verification_email_input.dart';

class RequestVerificationEmailMutation extends GraphQLMutation {
  final RequestVerificationEmailInput input;

  RequestVerificationEmailMutation(this.input) : super();

  @override
  String get name => 'requestVerificationEmail';

  @override
  String get query => '''
        mutation RequestVerificationEmail(\$emailInput: EmailInput!) {
            $name(emailInput: \$emailInput) {
              $generalResultFragment
            }
        }
    ''';

  @override
  Map<String, dynamic>? get variables => {'emailInput': input.toJson()};
}
