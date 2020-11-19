import 'dart:async';

import 'package:async/async.dart';
import 'package:dart_strapi/dart_strapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:frontend/src/api/authentication_api_provider.dart';
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
  final strapiClient = Strapi.newClient();

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
      _waitingToStartSearchingMail = Timer(Duration(milliseconds: 1000), () {
        setState(() {
          Log.debug("BEGIN searching");
          _showSpinningCircleStartSearchingEmail = true;
        });
      });
    });
  }

  Future<bool> _searchEmail({@required String email}) async {
    bool isEmailExist =
        await AuthenticationApiProvider().isEmailExist(email: _email.text);
    print("isEmailExist : " + isEmailExist.toString());
    return isEmailExist;
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
        _password.text = "";
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
                      yield SizedBox(height: 34.0);
                      /*  yield Text(
                        (!_showLoginForm && !_showLoginForm)
                            ? "Enter your email address"
                            : (_showLoginForm)
                                ? "Email found"
                                : "Email not found",
                        style: Theme.of(context).textTheme.headline6,
                      ); */
                      yield SizedBox(height: 24.0);
                      yield email;
                      if (_showSpinningCircleStartSearchingEmail)
                        yield FutureBuilder<bool>(
                          future: AuthenticationApiProvider()
                              .isEmailExist(email: _email.text),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Text(
                                "Error",
                                style: Theme.of(context).textTheme.headline4,
                              );
                            } else if (snapshot.connectionState ==
                                    ConnectionState.none &&
                                snapshot.hasData == null) {
                              return Text(
                                "No internet",
                                style: Theme.of(context).textTheme.headline4,
                              );
                            } else if (!snapshot.hasData) {
                              return SpinKitCircle(
                                color: Theme.of(context).accentColor,
                                size: 70.0,
                              );
                            } else {
                              return Column(
                                children: [
                                  SizedBox(height: 17.0),
                                  Text(
                                      snapshot.data
                                          ? 'Email found'
                                          : 'New email',
                                      style: TextStyle(
                                          fontSize: Theme.of(context)
                                              .textTheme
                                              .headline6
                                              .fontSize)),
                                  SizedBox(height: 17.0),
                                  password,
                                  SizedBox(height: 24.0),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      snapshot.data ? 'Login' : 'Sign Up',
                                      style: TextStyle(
                                          fontSize: Theme.of(context)
                                              .textTheme
                                              .headline5
                                              .fontSize),
                                    ),
                                  ),
                                ],
                              );
                              if (snapshot.data) {
                                return Text(
                                  "Login",
                                  style: Theme.of(context).textTheme.headline4,
                                );
                              } else {
                                return Text(
                                  "SignUp",
                                  style: Theme.of(context).textTheme.headline4,
                                );
                              }
                            }
                          },
                        );
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
