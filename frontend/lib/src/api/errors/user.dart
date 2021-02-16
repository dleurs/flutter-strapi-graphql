import 'package:frontend/src/api/base/request_errors.dart';

class UserAlreadyExistsException extends RequestException {}

class LoginFailedException extends RequestException {}

class UserNotFoundException extends RequestException {}

class BackendErrorNoPermissionException extends RequestException {}

class UserRequestFailedException extends RequestException {
  UserRequestFailedException(List<RequestError> errors) : super(errors: errors);
}
