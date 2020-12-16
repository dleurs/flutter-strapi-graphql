part of 'todos_bloc.dart';

abstract class TodosState extends Equatable {
  const TodosState();

  @override
  List<Object> get props => [];
}

class TodosInitial extends TodosState {}

class GetTodosSuccess extends TodosState {
  final List<Todo> todos;
  GetTodosSuccess(this.todos);
}

class GetTodosLoading extends TodosState {}

class GetTodosError extends TodosState {}

class CreateTodoSuccess extends TodosState {
  final todo;
  CreateTodoSuccess(this.todo);
}

class CreateTodoLoading extends TodosState {}

class CreateTodoError extends TodosState {}
