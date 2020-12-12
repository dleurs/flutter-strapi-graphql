import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:frontend/src/api/authentication_api_provider.dart';
import 'package:frontend/src/bloc/authentication/bloc.dart';
import 'package:frontend/src/bloc/formLoginSignUp/bloc.dart';
import 'package:frontend/src/helpers/constant.dart';
import 'package:frontend/src/helpers/toList.dart';
import 'package:frontend/src/helpers/validator.dart';
import 'package:frontend/src/ui/screen/base_screen.dart';

class LoginSignupScreen extends StatefulWidget {
  final String targetRouteName;

  LoginSignupScreen({Key key, @required this.targetRouteName})
      : super(key: key);

  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends BaseScreenState<LoginSignupScreen> {
  FormLoginSignupBloc _blocForm;

  @override
  void initState() {
    super.initState();
    _blocForm = FormLoginSignupBloc(AuthenticationApiProvider());
  }

  @override
  void dispose() {
    _blocForm.close();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  bool _showPasswordEyeIcon = false;
  bool _passwordObscur = true;
  bool _showModifyEmailIcon = false;

  @override
  Widget buildScreen(BuildContext context) {
    TextFormField email({@required bool emailVerified}) {
      return TextFormField(
        readOnly: emailVerified,
        style:
            TextStyle(color: emailVerified ? Colors.grey[700] : Colors.black),
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        controller: _email,
        validator: Validator.validateEmail,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.email,
            color: Colors.grey,
          ),
          suffixIcon: _showModifyEmailIcon
              ? IconButton(
                  onPressed: () {
                    _showModifyEmailIcon = false;
                    _email.text = "";
                    _blocForm.add(CheckEmailReset());
                  },
                  icon: Icon(Icons.cached_outlined))
              : SizedBox(),
          hintText: 'Email',
          contentPadding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
        onChanged: (String email) {
          setState(() {
            _showModifyEmailIcon = true;
          });
        },
      );
    }

    final password = TextFormField(
      autofocus: false,
      obscureText: _passwordObscur,
      controller: _password,
      validator: Validator.validatePassword,
      onChanged: (String password) {
        setState(() {
          _showPasswordEyeIcon = true;
        });
      },
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.lock,
          color: Colors.grey,
        ), // icon is 48px widget.

        suffixIcon: _showPasswordEyeIcon
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _passwordObscur = !_passwordObscur;
                  });
                },
                icon: Icon(Icons.remove_red_eye_outlined))
            : SizedBox(), // icon is 48px widget.

        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Const.mediumHeight)),
      ),
    );

    return ListView(children: [
      Form(
          key: _formKey,
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: Const.smallHeight),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: toList(
                    () sync* {
                      yield SizedBox(height: Const.mediumHeight);
                      yield Text(
                        "Welcome",
                        style: Theme.of(context).textTheme.headline5,
                      );
                      yield SizedBox(height: Const.smallHeight);

                      yield BlocBuilder<FormLoginSignupBloc,
                          FormLoginSignupState>(
                        cubit: _blocForm,
                        builder: (context, formState) {
                          if (formState is FormLoginSignupInitial) {
                            return Column(
                              children: [
                                email(emailVerified: false),
                                SizedBox(height: Const.smallHeight),
                                ElevatedButton(
                                  child: Text(
                                    'Login / Signup',
                                    style: TextStyle(
                                        fontSize: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            .fontSize),
                                  ),
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                      _blocForm.add(
                                          CheckEmailEvent(email: _email.text));
                                    }
                                  },
                                ),
                              ],
                            );
                          }
                          if (formState is CheckEmailProcessing) {
                            return Column(
                              children: [
                                email(emailVerified: false),
                                SizedBox(height: Const.smallHeight),
                                SpinKitCircle(
                                  color: Theme.of(context).accentColor,
                                  size: 70.0,
                                ),
                              ],
                            );
                          }
                          if (formState is CheckEmailError) {
                            return Column(
                              children: [
                                email(emailVerified: false),
                                SizedBox(height: Const.smallHeight),
                                Text("An error occured. Do you have internet ?",
                                    style: TextStyle(
                                        fontSize: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            .fontSize)),
                              ],
                            );
                          }
                          if (formState is EmailAlreadyExist ||
                              formState is EmailDoesNotExist) {
                            return Column(
                              children: [
                                email(emailVerified: true),
                                SizedBox(height: Const.smallHeight),
                                BlocBuilder<AuthenticationBloc,
                                        AuthenticationState>(
                                    builder: (context, authState) {
                                  print(authState);
                                  return Column(
                                    children: [
                                      Text(
                                          (formState is EmailAlreadyExist)
                                              ? 'Email exists'
                                              : 'New email',
                                          style: TextStyle(
                                              fontSize: Theme.of(context)
                                                  .textTheme
                                                  .headline6
                                                  .fontSize)),
                                      SizedBox(height: Const.smallHeight),
                                      password,
                                      (authState is WrongPassword)
                                          ? Text(
                                              'Wrong password',
                                              style:
                                                  TextStyle(color: Colors.red),
                                            )
                                          : SizedBox(),
                                      SizedBox(height: Const.smallHeight),
                                      (formState is EmailAlreadyExist)
                                          ? ElevatedButton(
                                              onPressed: () async {
                                                if (_formKey.currentState
                                                    .validate()) {
                                                  this.doLogin(_email.text,
                                                      _password.text);
                                                }
                                              },
                                              child: Text(
                                                'Login',
                                                style: TextStyle(
                                                    fontSize: Theme.of(context)
                                                        .textTheme
                                                        .headline5
                                                        .fontSize),
                                              ))
                                          : ElevatedButton(
                                              onPressed: () {},
                                              child: Text(
                                                'Signup',
                                                style: TextStyle(
                                                    fontSize: Theme.of(context)
                                                        .textTheme
                                                        .headline5
                                                        .fontSize),
                                              )),
                                    ],
                                  );
                                }),
                              ],
                            );
                          }

                          return SizedBox();
                        },
                      );
                    },
                  ),
                ),
              )))
    ]);
  }

  @override
  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(title: Text('Register & Login'));
  }

  @override
  void onLoggedIn() {
    //BlocProvider.of<AuthenticationBloc>(context).add(LoginEvent("username", "password"));
    Navigator.pushReplacementNamed(context, widget.targetRouteName);
  }
}
