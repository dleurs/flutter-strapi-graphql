import 'package:flutter/material.dart';

@immutable
abstract class FormLoginSignupState {}

class FormLoginSignupInitial extends FormLoginSignupState {
  @override
  String toString() {
    return 'FormLoginSignupInitial';
  }
}

class CheckEmailProcessing extends FormLoginSignupState {
  @override
  String toString() {
    return 'CheckEmailProcessing';
  }
}

class EmailAlreadyExist extends FormLoginSignupState {
  @override
  String toString() {
    return 'CheckEmailAlreadyExist';
  }
}

class EmailDoesNotExist extends FormLoginSignupState {
  @override
  String toString() {
    return 'CheckEmailDoesNotExist';
  }
}

class CheckEmailError extends FormLoginSignupState {
  final String error;

  CheckEmailError({this.error});

  @override
  String toString() {
    return 'CheckEmailError{error: $error}';
  }
}
