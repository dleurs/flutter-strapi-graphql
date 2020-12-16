import 'package:artemis/client.dart';
import 'package:flutter/material.dart';
import 'package:frontend/config.dart';
import 'package:frontend/src/api/base/graphql_client.dart';
import 'package:frontend/src/api/interceptor/authorization_interceptor.dart';
import 'package:frontend/src/api/requests/create_todo_request.dart';
import 'package:frontend/src/api/requests/get_todos_request.dart';
import 'package:frontend/src/api/requests/update_todo_request.dart';
import 'package:frontend/src/models/todo.dart';

class TodoApiProvider {
  ArtemisClient get client => ArtemisClient(Config.authApiEndpoint,
      httpClient: GraphQLClientBuilder()
          .addInterceptor(AuthorizationInterceptor())
          .build());

  Future<List<Todo>> getTodos({@required String userId}) {
    return GetTodosRequest(client, userId: userId).call();
  }

  Future<Todo> createTodo(
      {@required String todoName,
      @required bool done,
      @required String userId}) {
    return CreateTodoRequest(client, name: todoName, done: done, userId: userId)
        .call();
  }

  Future<Todo> updateTodo(
      {@required String todoId, String todoName, bool done, String userId}) {
    return UpdateTodoRequest(client,
            todoId: todoId, name: todoName, done: done, authorId: userId)
        .call();
  }
}
