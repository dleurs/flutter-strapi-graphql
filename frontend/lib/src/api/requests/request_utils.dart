import 'package:flutter/material.dart';
import 'package:frontend/src/api/base/request_errors.dart';
import 'package:frontend/src/helpers/log.dart';

class RequestUtils {
  static String getLanguage(Locale locale) {
    return locale.languageCode.toUpperCase();
  }

  static bool hasErrorCode(List<RequestError> errors, String code) {
    var filteredErrors = List();
    filteredErrors.addAll(errors);
    filteredErrors.retainWhere((element) =>
        element.extensions != null &&
        element.extensions.isNotEmpty &&
        element.extensions.containsValue(code));

    Log.debug(
        "Filtered errors for code $code: $filteredErrors, original errors: $errors");
    return filteredErrors.isNotEmpty;
  }

  static bool hasErrorMessage(List<RequestError> errors, String codeMessage) {
    var filteredErrors = List();
    filteredErrors.addAll(errors);
    filteredErrors.retainWhere((element) =>
        element.message != null &&
        element.message.isNotEmpty &&
        element.message == codeMessage);
    Log.debug(
        "Filtered errors for code $codeMessage: $filteredErrors, original errors: $errors");
    return filteredErrors.isNotEmpty;
  }
}
