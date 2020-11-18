import 'package:flutter/material.dart';
import 'package:frontend/src/ui/screen/base_screen.dart';

class LoginScreen extends StatefulWidget {
  final String targetRouteName;

  LoginScreen({Key key, @required this.targetRouteName}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseScreenState<LoginScreen> {
  @override
  Widget buildScreen(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Login page'),
          RaisedButton(
            onPressed: () {
              this.doLogin("username", "password");
            },
            child: Text('Login'),
            key: Key("LoginButton"),
          )
        ],
      ),
    );
  }

  @override
  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(title: Text('Login Screen'));
  }

  @override
  void onLoggedIn() {
    //BlocProvider.of<AuthenticationBloc>(context).add(LoginEvent("username", "password"));
    Navigator.pushReplacementNamed(context, widget.targetRouteName);
  }
}
