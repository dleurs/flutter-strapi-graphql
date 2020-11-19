import 'package:artemis/client.dart';
import 'package:artemis/schema/graphql_query.dart';
import 'package:json_annotation/src/json_serializable.dart';

import 'package:frontend/generated/graphql/todo_api.graphql.dart';
import 'package:frontend/src/api/base/graphql_request.dart';
import 'package:frontend/src/models/todo.dart';

class GetTodosRequest extends GraphQLRequest<List<Todo>, GetTodos$Query> {
  GetTodosRequest(ArtemisClient client) : super(client);

  @override
  GraphQLQuery<GetTodos$Query, JsonSerializable> buildQuery() {
    return GetTodosQuery();
  }

  @override
  List<Todo> buildResponse(GetTodos$Query data) {
    List<Todo> myTodos = List<Todo>();
    for (GetTodos$Query$Todos todo in data.todos) {
      myTodos.add(Todo(id: int.parse(todo.id), name: todo.name));
    }
    return myTodos;
  }
}
