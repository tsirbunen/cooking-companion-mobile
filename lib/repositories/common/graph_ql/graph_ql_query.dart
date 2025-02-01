abstract class GraphQLQuery {
  String get name;
  String get query;
  Map<String, dynamic>? get variables => null;
}
