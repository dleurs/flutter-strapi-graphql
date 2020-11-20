import 'package:flutter/widgets.dart';

class RequestError {
  String message;
  Map<String, dynamic> extensions;

  RequestError({@required this.message, this.extensions = const {}});

  @override
  String toString() {
    return 'RequestError{message: $message, extensions: $extensions}';
  }
}

class RequestException implements Exception {
  List<RequestError> errors;

  RequestException({this.errors = const []});

  @override
  String toString() {
    return 'RequestException{errors: $errors}';
  }
}

class ErrorCodes {
  static final String WRONG_CREDENTIALS = "wrong_credentials";
  static final String NOT_FOUND = "not_found";
  static final String LOGIN_REQUIRED = "login_required";
  static final String UNAUTHORIZED = "unauthorized";
  static final String ARGUMENT_ERROR = "argument_error";
  static final String INTERNAL_ERROR = "internal_error";
}