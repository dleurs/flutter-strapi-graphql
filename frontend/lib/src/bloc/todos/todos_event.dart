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
