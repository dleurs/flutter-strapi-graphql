import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:frontend/src/bloc/todos/todos_bloc.dart';
import 'package:frontend/src/core/authentication/authentication_manager.dart';
import 'package:frontend/src/helpers/constant.dart';
import 'package:frontend/src/helpers/log.dart';
import 'package:frontend/src/helpers/validator.dart';
import 'package:frontend/src/ui/components/checkbox_form_field.dart';
import 'package:frontend/src/ui/screen/base_screen.dart';

class CreateTodoScreen extends StatefulWidget {
  CreateTodoScreen({
    Key key,
  }) : super(key: key);

  @override
  _CreateTodoScreenState createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends BaseScreenState<CreateTodoScreen> {
  TodosBloc _bloc;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _todoName = new TextEditingController();
  bool _todoDone;

  @override
  void initState() {
    super.initState();
    _bloc = TodosBloc();
  }

  @override
  void dispose() {
    _bloc.close();
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
    final todoName = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      controller: _todoName,
      validator: Validator.notEmpty,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.grey,
        ),
        hintText: 'Todo name',
        contentPadding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final todoDone = CheckboxFormField(
      title: Text("Done"),
      onSaved: (val) {
        _todoDone = val;
      },
    );

    return ListView(
      children: [
        SizedBox(height: Const.smallHeight),
        Center(
            child: Text("Create a todo",
                style: Theme.of(context).textTheme.headline5)),
        SizedBox(height: Const.smallHeight),
        Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Const.smallHeight),
            child: SingleChildScrollView(
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    todoName,
                    todoDone,
                    ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {}
                        },
                        child: Text(
                          'Add todo',
                          style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .fontSize),
                        ))
                  ]),
            ),
          ),
        )
      ],
    );
  }
}
