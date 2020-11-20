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

class NetworkException implements Exception {
  final Exception originalException;

  NetworkException({this.originalException});

  @override
  String toString() {
    return 'NetworkException{originalException: $originalException}';
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
  static final String EMAIL_EXIST = "email_exist";
  static final String PHONE_EXIST = "phone_exist";
  static final String WRONG_CREDENTIALS = "wrong_credentials";

  static final String WRONG_REFERRAL_CODE = "wrong_referral_code";

  static final String NOT_FOUND = "not_found";
  static final String LOGIN_REQUIRED = "login_required";
  static final String UNAUTHORIZED = "unauthorized";
  static final String ARGUMENT_ERROR = "argument_error";
  static final String INTERNAL_ERROR = "internal_error";

  static final String SCAN_LIMIT_REACHED = "scan_count_exceeded";
  static final String RECEIPT_OUTDATED = "receipt_too_old";
  static final String RECEIPT_ALREADY_SCANNED = "duplicate_receipt";
  static final String RECEIPT_NOT_RECOGNIZED = "receipt_not_recognized";

  static final String NO_CODE_LEFT = "no_promo_code_left";
}
