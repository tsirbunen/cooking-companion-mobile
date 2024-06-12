import 'package:graphql/client.dart';
import 'package:mobile/core/logger/logger.dart';
import 'dart:async';

/// This interceptor logs the query / mutation that the graphql client
/// is about to make. Inspiration was taken from the `http_interceptor`
/// package (https://pub.dev/packages/http_interceptor).
class GraphQLQueryInterceptor extends Link {
  final Link _link;
  GraphQLQueryInterceptor(this._link);

  @override
  Stream<Response> request(Request request, [NextLink? forward]) {
    final queryWithNewlines = _getQueryWithProperNewlines(request);
    logger.info(queryWithNewlines, runtimeType);

    return _link.request(request, forward);
  }

  _getQueryWithProperNewlines(Request request) {
    // Note: We need to replace the "\n" sequences in the String with
    // real newlines to make the log prettier / more readable.
    return request.operation.toString().split('"')[1].replaceAll('\\n', '\n');
  }
}
