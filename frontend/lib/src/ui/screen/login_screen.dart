import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:frontend/src/helpers/log.dart';
import 'dart:io';
import 'package:frontend/src/helpers/validator.dart';
import 'package:frontend/src/ui/screen/base_screen.dart';

class LoginScreen extends StatefulWidget {
  final String targetRouteName;

  LoginScreen({Key key, @required this.targetRouteName}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseScreenState<LoginScreen> {
  final _emailFormKey = GlobalKey<FormState>();

  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  bool _showPassword = false;
  bool _showSeePasswordIcon = false;
  bool _showSearchingEmailIcon = false;
  bool _startSearchingEmail = false;

  @override
  Widget buildScreen(BuildContext context) {
    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      controller: _email,
      validator: Validator.validateEmail,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.email,
          color: Colors.grey,
        ),
        suffixIcon: _showSearchingEmailIcon
            ? IconButton(
                icon: Icon(Icons.person_search),
                onPressed: () {
                  setState(() {
                    _startSearchingEmail = true;
                  });
                },
              )
            : SizedBox(),
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      onChanged: (String email) async {
        _startSearchingEmail = false;
        if (Validator.validateEmail(_email.text) == null) {
          setState(() {
            _showSearchingEmailIcon = true;
          });
        } else {
          setState(() {
            _showSearchingEmailIcon = false;
          });
        }
      },
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: !_showPassword,
      controller: _password,
      validator: Validator.validatePassword,
      onChanged: (String password) {
        if (password.isNotEmpty ?? false) {
          setState(() {
            _showSeePasswordIcon = true;
          });
        } else {
          setState(() {
            _showSeePasswordIcon = false;
          });
        }
      },
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.lock,
          color: Colors.grey,
        ), // icon is 48px widget.

        suffixIcon: _showSeePasswordIcon
            ? IconButton(
                icon: Icon(Icons.remove_red_eye_outlined),
                onPressed: () {
                  setState(() {
                    _showPassword = !_showPassword;
                  });
                },
              )
            : SizedBox(), // icon is 48px widget.

        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    return ListView(children: [
      Form(
          key: _emailFormKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(height: 24.0),
                  email,
                  SizedBox(height: 24.0),
                  _startSearchingEmail
                      ? SpinKitCircle(
                          color: Theme.of(context).accentColor,
                          size: 70.0,
                        )
                      : SizedBox(),
                  SizedBox(height: 24.0),
                  password,
                  SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, otherwise false.
                      if (_emailFormKey.currentState.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.

                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('Processing Data')));
                      }
                    },
                    child: Text(
                      'Enter',
                      style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.headline5.fontSize),
                    ),
                  ),
                ],
              ),
            ),
          ))
    ]);
    /* Column(
      children: <Widget>[
        ,
        RaisedButton(
          onPressed: () {
            this.doLogin("username", "password");
          },
          child: Text('Enter', style: Theme.of(context).textTheme.headline5),
          key: Key("LoginButton"),
        )
      ],
    ); */
  }

  @override
  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(title: Text('Signup & Login'));
  }

  @override
  void onLoggedIn() {
    //BlocProvider.of<AuthenticationBloc>(context).add(LoginEvent("username", "password"));
    Navigator.pushReplacementNamed(context, widget.targetRouteName);
  }
}
