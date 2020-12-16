import 'package:flutter/services.dart';
import 'package:frontend/src/bloc/authentication/bloc.dart';

class Validator {
  static String validateEmail(String value) {
    Pattern pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Please enter a valid email address.';
    else
      return null;
  }

  static String validatePassword(String value) {
    Pattern pattern = r'^.{6,}$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Password must be at least 6 characters.';
    else
      return null;
  }

  static String notEmpty(String value) {
    if (value == null || value.isEmpty)
      return 'Todo name empty';
    else
      return null;
  }
}
