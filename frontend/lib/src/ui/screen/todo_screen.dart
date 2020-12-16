import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:frontend/src/bloc/todos/todos_bloc.dart';
import 'package:frontend/src/core/authentication/authentication_manager.dart';
import 'package:frontend/src/helpers/log.dart';
import 'package:frontend/src/ui/screen/base_screen.dart';

class TodoScreen extends StatefulWidget {
  TodoScreen({
    Key key,
  }) : super(key: key);

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends BaseScreenState<TodoScreen> {
  TodosBloc _bloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(title: Text('Todo Screen'), actions: <Widget>[
      IconButton(
          icon: Icon(Icons.power_settings_new), onPressed: this.doLogout),
    ]);
  }

  @override
  Widget buildScreen(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 20),
        Center(
            child:
                Text("A todo", style: Theme.of(context).textTheme.headline5)),
        Center(
            child: Text(
          AuthenticationManager.instance.toString(),
        )),
      ],
    );
  }
}
