import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:frontend/src/api/authentication_api_provider.dart';
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
  FormLoginSignupBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = FormLoginSignupBloc(AuthenticationApiProvider());
  }

  @override
  void dispose() {
    _bloc.close();
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
        suffixIcon: _showModifyEmailIcon
            ? IconButton(
                onPressed: () {
                  _showModifyEmailIcon = false;
                  _email.text = "";
                  _bloc.add(CheckEmailReset());
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
                      yield email;
                      yield SizedBox(height: Const.smallHeight);
                      yield BlocBuilder<FormLoginSignupBloc,
                          FormLoginSignupState>(
                        cubit: _bloc,
                        builder: (context, state) {
                          if (state is FormLoginSignupInitial) {
                            return ElevatedButton(
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
                                  _bloc
                                      .add(CheckEmailEvent(email: _email.text));
                                }
                              },
                            );
                          }
                          if (state is CheckEmailProcessing) {
                            return SpinKitCircle(
                              color: Theme.of(context).accentColor,
                              size: 70.0,
                            );
                          }
                          if (state is EmailAlreadyExist ||
                              state is EmailDoesNotExist) {
                            return Column(
                              children: [
                                Text(
                                    (state is EmailAlreadyExist)
                                        ? 'Email exists'
                                        : 'New email',
                                    style: TextStyle(
                                        fontSize: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            .fontSize)),
                                SizedBox(height: Const.smallHeight),
                                password,
                                SizedBox(height: Const.smallHeight),
                                (state is EmailAlreadyExist)
                                    ? ElevatedButton(
                                        onPressed: () async {
                                          if (_formKey.currentState
                                              .validate()) {
                                            this.doLogin(
                                                _email.text, _password.text);
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
                                        ))
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
