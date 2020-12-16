part of 'todos_bloc.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();

  @override
  List<Object> get props => [];
}

class GetTodos extends TodosEvent {
  final String userId;

  GetTodos({@required this.userId});

  @override
  List<Object> get props => [userId];
}

class CreateTodo extends TodosEvent {
  final String todoName;
  final bool todoDone;
  final String userId;

  CreateTodo(
      {@required this.todoName,
      @required this.todoDone,
      @required this.userId});

  @override
  List<Object> get props => [todoName, todoDone, userId];
}

class UpdateTodo extends TodosEvent {
  final String todoId;
  final String todoName;
  final bool todoDone;
  final String userId;

  UpdateTodo(
      {@required this.todoId, this.todoName, this.todoDone, this.userId});

  @override
  List<Object> get props => [todoName, todoDone, userId];
}

class DeleteTodo extends TodosEvent {
  final String todoId;

  DeleteTodo({
    @required this.todoId,
  });

  @override
  List<Object> get props => [todoId];
}
