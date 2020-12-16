import 'package:artemis/client.dart';
import 'package:artemis/schema/graphql_query.dart';
import 'package:flutter/material.dart';
import 'package:frontend/src/models/user.dart';
import 'package:json_annotation/src/json_serializable.dart';

import 'package:frontend/generated/graphql/todo_api.graphql.dart';
import 'package:frontend/src/api/base/graphql_request.dart';
import 'package:frontend/src/models/todo.dart';

class UpdateTodoRequest extends GraphQLRequest<Todo, UpdateTodo$Mutation> {
  final String todoId;
  final String name;
  final bool done;
  final String authorId;
  UpdateTodoRequest(ArtemisClient client,
      {@required this.todoId, this.name, this.done, this.authorId})
      : super(client);

  @override
  GraphQLQuery<UpdateTodo$Mutation, JsonSerializable> buildQuery() {
    return UpdateTodoMutation(
        variables: UpdateTodoArguments(
            todoId: todoId,
            todoName: name,
            todoDone: done,
            authorId: authorId));
  }

  @override
  Todo buildResponse(UpdateTodo$Mutation data) {
    var jsonTodo = data.updateTodo.todo;
    return Todo(
      id: jsonTodo.id,
      name: jsonTodo.name,
      done: jsonTodo.done,
      author: User(id: jsonTodo.author.id),
    );
  }
}
