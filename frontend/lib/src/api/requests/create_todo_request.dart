import 'package:artemis/client.dart';
import 'package:artemis/schema/graphql_query.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/src/json_serializable.dart';

import 'package:frontend/generated/graphql/todo_api.graphql.dart';
import 'package:frontend/src/api/base/graphql_request.dart';
import 'package:frontend/src/models/todo.dart';

class CreateTodoRequest extends GraphQLRequest<Todo, CreateTodo$Mutation> {
  final String name;
  final String userId;
  final bool done;
  CreateTodoRequest(ArtemisClient client,
      {@required this.userId, this.done = false, @required this.name})
      : super(client);

  @override
  GraphQLQuery<CreateTodo$Mutation, JsonSerializable> buildQuery() {
    return CreateTodoMutation(
        variables: CreateTodoArguments(name: name, done: done, userId: userId));
  }

  @override
  Todo buildResponse(CreateTodo$Mutation data) {
    var jsonTodo = data.createTodo.todo;
    return Todo(
      id: jsonTodo.id,
      name: jsonTodo.name,
    );
  }
}
