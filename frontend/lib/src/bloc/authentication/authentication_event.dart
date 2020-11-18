import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {}

class LoginEvent extends AuthenticationEvent {
  final String login;
  final String password;

  LoginEvent(this.login, this.password);

  @override
  List<Object> get props => [login];
}

class LogoutEvent extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}
