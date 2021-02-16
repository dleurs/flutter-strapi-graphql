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
  static final String INTERNAL_SERVER_ERROR = "INTERNAL_SERVER_ERROR";
}

class ErrorMessages {
  static final String FORBIDDEN = "Forbidden";
}
