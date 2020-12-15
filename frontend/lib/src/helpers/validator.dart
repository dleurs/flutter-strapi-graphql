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

  static String validateTribeEntryCode(String value) {
    Pattern pattern = r'^[a-zA-Z0-9]{6}$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Only 6 characters';
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

  static String validatePseudo(String value) {
    Pattern pattern = r"^[a-z0-9 \u0401\u0451\u0410-\u044f]{2,14}$";
    RegExp regex = new RegExp(pattern, caseSensitive: false);
    if (!regex.hasMatch(value))
      return 'Pseudo must be letters, space and numbers, 2 to 14.';
    else
      return null;
  }

  static String validateTrbClcArtName(String value) {
    //Pattern pattern = r"^[a-zA-Z0-9 ]{1,20}$";
    //Pattern pattern = r"^[a-zA-Z0-9 \u00a9\u00ae\u2000-\u3300\ud83c\ud000-\udfff\ud83d\ud000-\udfff\ud83e\ud000-\udfff]{3,16}$";
    Pattern pattern = r"^.{2,25}$";
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Between 2 to 25 characters.';
    else
      return null;
  }

  static String getExceptionText(Exception e) {
    if (e is PlatformException) {
      switch (e.message) {
        case 'There is no user record corresponding to this identifier. The user may have been deleted.':
          return 'User with this email address not found';
          break;
        case 'The password is invalid or the user does not have a password.':
          return 'Invalid password, but this email address exist';
          break;
        case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
          return 'No internet connection';
          break;
        case 'The email address is already in use by another account.':
          return 'This email address already has an account';
          break;
        case 'We have blocked all requests from this device due to unusual activity. Try again later. [ Too many unsuccessful login attempts. Please try again later. ]':
          return 'Too many unsuccessful login attempts, please try again later';
          break;
        default:
          return 'Unknown error occured. (${e.message})';
      }
    } else if (e is PseudoAlredyUsedException) {
      return "Pseudo already used";
    } else {
      return 'Unknown error occured.';
    }
  }
}

class PseudoAlredyUsedException implements Exception {
  const PseudoAlredyUsedException();
}
