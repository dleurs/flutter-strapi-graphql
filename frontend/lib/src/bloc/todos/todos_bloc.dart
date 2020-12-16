import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
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
        List<Todo> todos =
            await TodoApiProvider().getTodos(userId: event.userId);
        yield GetTodosSuccess(todos);
      } catch (e) {
        yield GetTodosError(error: e);
      }
    }

    if (event is CreateTodo) {
      yield CreateTodoLoading();
      try {
        Todo todo = await TodoApiProvider().createTodo(
            todoName: event.todoName,
            done: event.todoDone,
            userId: event.userId);
        yield CreateTodoSuccess(todo);
      } catch (e) {
        yield CreateTodoError(error: e);
      }
    }
  }
}
