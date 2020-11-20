import 'package:frontend/src/api/errors/base.dart';

class UserAlreadyExistsException extends RequestException {}

class WrongReferralCodeException extends RequestException {}

class PhoneAlreadyExistsException extends RequestException {}

class LoginFailedException extends RequestException {}

class UserNotFoundException extends RequestException {}

class UserRequestFailedException extends RequestException {
  UserRequestFailedException(List<RequestError> errors) : super(errors: errors);
}
