import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'graphql/api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Query(
          options:
              QueryOptions(documentNode: gql(getRestaurant), pollInterval: 1),
          builder: (QueryResult result,
              {VoidCallback refetch, FetchMore fetchMore}) {
            if (result.hasException) {
              return Text(result.exception.toString());
            } else {
              if (result.loading) {
                return CircularProgressIndicator();
              } else {
                List<dynamic> listRestaurant =
                    result.data['restaurants'].toList();
                return ListView.builder(
                    itemCount: listRestaurant.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(listRestaurant[index]['name']),
                      );
                    });
              }
            } //ListView.builder();
          }),
    );
  }
}
