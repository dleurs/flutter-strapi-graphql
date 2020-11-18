import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:frontend/src/core/authentication/authentication_manager.dart';
import 'package:frontend/src/models/authentication/token.dart';
import 'package:frontend/src/resource/login_repository.dart';

import './bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final LoginRepository _repository;

  AuthenticationBloc(this._repository) : super(InitialAuthenticationState());

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    yield AuthenticationProcessing();
    if (event is LoginEvent) {
      try {
        Token token = await _repository.login(event.login, event.password);
        await AuthenticationManager.instance
            .doLogin(event.login, event.password, token);
        yield AuthenticationSuccess();
      } catch (e) {
        await AuthenticationManager.instance.doLogout();
        yield AuthenticationError(error: 'Login failed');
      }
    }
    if (event is LogoutEvent) {
      await _repository.logout();
      AuthenticationManager.instance.doLogout();
      yield LoggedOut();
    }
  }
}
