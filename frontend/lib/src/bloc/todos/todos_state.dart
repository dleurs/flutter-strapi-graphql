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

class GetTodosError extends TodosState {
  final error;
  GetTodosError({this.error});
}

class CreateTodoSuccess extends TodosState {
  final Todo todo;
  CreateTodoSuccess(this.todo);
}

class CreateTodoLoading extends TodosState {}

class CreateTodoError extends TodosState {
  final error;
  CreateTodoError({this.error});
}

class UpdateTodoSuccess extends TodosState {
  final Todo todo;
  UpdateTodoSuccess(this.todo);
}

class DeleteTodoSuccess extends TodosState {}

class UpdateDeleteTodoLoading extends TodosState {}

class UpdateDeleteTodoError extends TodosState {
  final error;
  UpdateDeleteTodoError({this.error});
}
