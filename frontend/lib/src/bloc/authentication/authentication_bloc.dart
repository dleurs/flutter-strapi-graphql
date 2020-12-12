import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:frontend/src/api/authentication_api_provider.dart';
import 'package:frontend/src/core/authentication/authentication_manager.dart';
import 'package:frontend/src/models/authentication/token.dart';

import './bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationApiProvider _provider;

  AuthenticationBloc(this._provider) : super(InitialAuthenticationState());

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    yield AuthenticationProcessing();

    if (event is LoginEvent) {
      try {
        Token token = await _provider.login(
            email: event.login.toLowerCase(), password: event.password);
        await AuthenticationManager.instance
            .doLogin(event.login, event.password, token);
        yield AuthenticationSuccess();
      } catch (e) {
        if ((e?.errors?.last?.extensions["exception"]["data"]["message"]
                    .last["messages"]?.last["message"] ??
                "") ==
            "Identifier or password invalid.") {
          yield WrongPassword(error: "Wrong password");
        } else {
          yield AuthenticationError(error: 'Login failed');
        }
      }
    }
    if (event is LogoutEvent) {
      try {
        await _provider.logout();
        AuthenticationManager.instance.doLogout();
        yield LoggedOut();
      } catch (e) {}
    }
  }
}
