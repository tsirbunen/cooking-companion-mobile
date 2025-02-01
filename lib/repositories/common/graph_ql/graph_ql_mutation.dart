import 'package:mobile/repositories/common/graph_ql/graph_ql_query.dart';

abstract class GraphQLMutation extends GraphQLQuery {
  @override
  Map<String, dynamic>? get variables;
}
