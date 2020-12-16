import 'package:artemis/client.dart';
import 'package:artemis/schema/graphql_query.dart';
import 'package:flutter/material.dart';
import 'package:frontend/src/models/user.dart';
import 'package:json_annotation/src/json_serializable.dart';

import 'package:frontend/generated/graphql/todo_api.graphql.dart';
import 'package:frontend/src/api/base/graphql_request.dart';
import 'package:frontend/src/models/todo.dart';

class DeleteTodoRequest extends GraphQLRequest<Todo, DeleteTodo$Mutation> {
  final String todoId;
  final String name;
  final bool done;
  final String authorId;
  DeleteTodoRequest(ArtemisClient client,
      {@required this.todoId, this.name, this.done, this.authorId})
      : super(client);

  @override
  GraphQLQuery<DeleteTodo$Mutation, JsonSerializable> buildQuery() {
    return DeleteTodoMutation(
        variables: DeleteTodoArguments(
      todoId: todoId,
    ));
  }

  @override
  Todo buildResponse(DeleteTodo$Mutation data) {
    var jsonTodo = data.deleteTodo.todo;
    return Todo(
      id: jsonTodo.id,
      name: jsonTodo.name,
    );
  }
}
