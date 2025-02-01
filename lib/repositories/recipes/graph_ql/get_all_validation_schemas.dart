// ignore_for_file: constant_identifier_names

import 'package:mobile/repositories/recipes/graph_ql/fragments.dart';
import 'package:mobile/repositories/common/graph_ql/graph_ql_query.dart';

enum ValidationTarget {
  EMAIL_ACCOUNT_INPUT,
  SIGN_IN_TO_EMAIL_ACCOUNT_INPUT,
  REQUEST_VERIFICATION_EMAIL_INPUT,
  PROVIDER_ACCOUNT_INPUT,
  DELETE_ACCOUNT_INPUT,
  CREATE_RECIPE_INPUT,
  PATCH_RECIPE_INPUT,
}

class FetchValidationSchemasQuery extends GraphQLQuery {
  final List<ValidationTarget> schemasToQuery;

  FetchValidationSchemasQuery({List<ValidationTarget>? schemas})
      : schemasToQuery = schemas ?? ValidationTarget.values;

  @override
  String get name => 'validationSchemas';

  @override
  String get query => '''
    query FetchValidationSchemas(\$schemas: [ValidationTarget!]!)  {
        $name(schemas: \$schemas) {
          $validationSchemaFragment
        }
    }
    ''';

  @override
  Map<String, dynamic>? get variables => {
        'schemas':
            schemasToQuery.map((e) => e.toString().split('.').last).toList()
      };
}
