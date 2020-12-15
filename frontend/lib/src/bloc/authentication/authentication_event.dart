import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AuthenticationEvent extends Equatable {}

class LoginEvent extends AuthenticationEvent {
  final String login;
  final String password;

  LoginEvent({@required this.login, @required this.password});

  @override
  List<Object> get props => [login];
}

class RegisterEvent extends AuthenticationEvent {
  final String login;
  final String password;

  RegisterEvent({@required this.login, @required this.password});

  @override
  List<Object> get props => [login];
}

class LogoutEvent extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}

class ResetEvent extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}
