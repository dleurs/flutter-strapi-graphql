import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class FormLoginSignupEvent extends Equatable {}

class CheckEmailEvent extends FormLoginSignupEvent {
  final String email;

  CheckEmailEvent({@required this.email});

  @override
  List<Object> get props => [email];
}

class CheckEmailReset extends FormLoginSignupEvent {
  @override
  List<Object> get props => [];
}
