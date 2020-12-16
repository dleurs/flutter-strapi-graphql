import 'package:artemis/client.dart';
import 'package:artemis/schema/graphql_query.dart';
import 'package:flutter/material.dart';
import 'package:frontend/src/models/user.dart';
import 'package:json_annotation/src/json_serializable.dart';

import 'package:frontend/generated/graphql/todo_api.graphql.dart';
import 'package:frontend/src/api/base/graphql_request.dart';
import 'package:frontend/src/models/todo.dart';

class GetTodosRequest extends GraphQLRequest<List<Todo>, GetTodos$Query> {
  final String userId;
  GetTodosRequest(ArtemisClient client, {@required this.userId})
      : super(client);

  @override
  GraphQLQuery<GetTodos$Query, JsonSerializable> buildQuery() {
    return GetTodosQuery(variables: GetTodosArguments(userId: userId));
  }

  @override
  List<Todo> buildResponse(GetTodos$Query data) {
    List<Todo> myTodos = List<Todo>();
    for (GetTodos$Query$Todo todo in data.todos) {
      myTodos.add(
        Todo(
          id: todo.id,
          name: todo.name,
          done: todo.done,
          author: User(id: todo.author.id, email: todo.author.email),
        ),
      );
    }
    return myTodos;
  }
}
