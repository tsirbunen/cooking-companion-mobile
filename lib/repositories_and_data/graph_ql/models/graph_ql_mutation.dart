import 'package:mobile/repositories_and_data/graph_ql/models/graph_ql_query.dart';

abstract class GraphQLMutation extends GraphQLQuery {
  Map<String, dynamic>? get variables;
}
