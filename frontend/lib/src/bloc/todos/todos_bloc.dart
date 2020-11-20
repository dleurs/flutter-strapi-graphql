import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:frontend/src/api/todo_api_provider.dart';
import 'package:frontend/src/models/todo.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  TodosBloc() : super(TodosInitial());

  @override
  Stream<TodosState> mapEventToState(
    TodosEvent event,
  ) async* {
    if (event is GetTodos) {
      yield GetTodosLoading();
      try {
        List<Todo> todos = await TodoApiProvider().getTodos();
        yield GetTodosSuccess(todos);
      } catch (e) {
        yield GetTodosError();
      }
    }
  }
}
