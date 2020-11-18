import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:frontend/src/helpers/log.dart';
import 'package:frontend/src/helpers/toList.dart';
import 'dart:io';
import 'package:frontend/src/helpers/validator.dart';
import 'package:frontend/src/models/todo.dart';
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

  bool _showPasswordEyeIcon = false;
  bool _showSearchingEmailIcon = false;
  bool _showSpinningCircleStartSearchingEmail = false;

  bool _showLoginForm = false;
  bool _showSignUpForm = false;

  Timer _waitingToStartSearchingMail;

  void _startTimer() {
    // https://stackoverflow.com/questions/17552757/is-there-any-way-to-cancel-a-dart-future
    setState(() {
      _waitingToStartSearchingMail = Timer(Duration(milliseconds: 500), () {
        setState(() {
          Log.debug("BEGIN searching");
          _showSpinningCircleStartSearchingEmail = true;
          setState(() {
            _waitingToStartSearchingMail =
                Timer(Duration(milliseconds: 3000), () {
              setState(() {
                Log.debug("END searching");
                _showSpinningCircleStartSearchingEmail = false;
                _showLoginForm = true;
              });
            });
          });
        });
      });
    });
  }

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
                  if (!_showSpinningCircleStartSearchingEmail) {
                    setState(() {
                      _showSpinningCircleStartSearchingEmail = true;
                    });
                  }
                },
              )
            : SizedBox(),
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      onChanged: (String email) {
        _showSpinningCircleStartSearchingEmail = false;
        _showLoginForm = false;
        if (_waitingToStartSearchingMail != null) {
          _waitingToStartSearchingMail.cancel();
        }
        if (Validator.validateEmail(_email.text) == null) {
          setState(() async {
            _showSearchingEmailIcon = true;
            _startTimer();
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
      obscureText: !_showLoginForm,
      controller: _password,
      validator: Validator.validatePassword,
      onChanged: (String password) {
        if (password.isNotEmpty ?? false) {
          setState(() {
            _showPasswordEyeIcon = true;
          });
        } else {
          setState(() {
            _showPasswordEyeIcon = false;
          });
        }
      },
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.lock,
          color: Colors.grey,
        ), // icon is 48px widget.

        suffixIcon: _showPasswordEyeIcon
            ? IconButton(
                icon: Icon(Icons.remove_red_eye_outlined),
                onPressed: () {
                  setState(() {
                    _showLoginForm = !_showLoginForm;
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
                  children: toList(
                    () sync* {
                      yield SizedBox(height: 24.0);
                      if (!_showLoginForm && !_showLoginForm)
                        yield Text(
                          "Enter your email address",
                          style: Theme.of(context).textTheme.headline6,
                        );
                      else if (_showLoginForm) {
                        yield Text(
                          "Email found. Please login",
                          style: Theme.of(context).textTheme.headline6,
                        );
                      } else {
                        yield Text(
                          "Email not found. Please sign up",
                          style: Theme.of(context).textTheme.headline6,
                        );
                      }
                      yield SizedBox(height: 24.0);
                      yield email;
                      if (_showSpinningCircleStartSearchingEmail)
                        yield* [
                          SizedBox(height: 24.0),
                          SpinKitCircle(
                            color: Theme.of(context).accentColor,
                            size: 70.0,
                          )
                        ];

                      if (_showLoginForm)
                        yield* [
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
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .fontSize),
                            ),
                          )
                        ];
                    },
                  ),
                ),
              )))
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
