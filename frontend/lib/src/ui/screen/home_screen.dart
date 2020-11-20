import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:frontend/src/bloc/todos/todos_bloc.dart';
import 'package:frontend/src/core/authentication/authentication_manager.dart';
import 'package:frontend/src/helpers/log.dart';
import 'package:frontend/src/ui/screen/base_screen.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  HomeScreen({Key key, @required this.title}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseScreenState<HomeScreen> {
  TodosBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = TodosBloc();
    _bloc.add(GetTodos());
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(title: Text('Home Screen'), actions: <Widget>[
      IconButton(
          icon: Icon(Icons.refresh),
          onPressed: () {
            _bloc.add(GetTodos());
          }),
      IconButton(
          icon: Icon(Icons.power_settings_new), onPressed: this.doLogout),
    ]);
  }

  @override
  Widget buildScreen(BuildContext context) {
    AuthenticationManager auth = AuthenticationManager.instance;

    return ListView(
      children: [
        SizedBox(height: 20),
        Center(
            child: Text("Your todos",
                style: Theme.of(context).textTheme.headline5)),
        SizedBox(height: 20),
        Center(
          child: BlocBuilder<TodosBloc, TodosState>(
            cubit: _bloc,
            builder: (context, state) {
              Log.debug("TodosBloc: state is $state");
              if (state is GetTodosLoading) {
                return SpinKitCircle(
                  color: Theme.of(context).accentColor,
                  size: 70.0,
                );
              }
              if (state is GetTodosSuccess) {
                return ConstrainedBox(
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * 0.65),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: state.todos.length,
                      itemBuilder: (_, index) {
                        return Card(
                            elevation: 4.0,
                            margin: new EdgeInsets.symmetric(
                                horizontal: 6.0, vertical: 4.0),
                            child: ListTile(
                              leading: Icon(Icons.card_travel),
                              title: Text(state.todos[index].name),
                              subtitle: Text(state.todos[index].id.toString()),
                            ));
                      },
                    ));
              }
              return Text("Error",
                  style: Theme.of(context).textTheme.headline6);
            },
          ),
        ),
        SizedBox(height: 20),
        Center(
            child: Text(
          AuthenticationManager.instance.toString(),
        )),
      ],
    );
  }
}
