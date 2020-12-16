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
