import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

ValueNotifier<GraphQLClient> client = ValueNotifier(
  GraphQLClient(
    cache: InMemoryCache(),
    link: HttpLink(uri: 'http://127.0.0.1:1337/graphql'),
  ),
);

final String getRestaurant = """
query getRestaurant {
  restaurants {
    id
    name
  }
}

""";
