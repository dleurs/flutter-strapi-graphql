import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/src/bloc/todos/todos_bloc.dart';
import 'package:frontend/src/helpers/log.dart';
import 'package:frontend/src/ui/screen/base_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseScreenState<HomeScreen> {
  TodosBloc _bloc;

  @override
  void initState() {
    _bloc = TodosBloc();
    _bloc.add(GetTodos());
  }

  @override
  void dispose() {
    _bloc.close();
  }

  @override
  Widget buildScreen(BuildContext context) {
    return BlocBuilder<TodosBloc, TodosState>(
      cubit: _bloc,
      builder: (context, state) {
        Log.debug("state is $state");
        if (state is GetTodosLoading) {
          return Text("Loading");
        }
        if (state is GetTodosSuccess) {
          return ListView.builder(
            itemCount: state.todos.length,
            itemBuilder: (_, index) {
              return ListTile(
                leading: Icon(Icons.card_travel),
                title: Text(state.todos[index].name),
                subtitle: Text(state.todos[index].id.toString()),
              );
            },
          );
        }
        return Text("Error");
      },
    );
  }
}