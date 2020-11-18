//TODO implement login mechanisms here
import 'package:frontend/src/models/authentication/token.dart';

class LoginRepository {
  Future<Token> login(String login, String password) {
    return Future.value(Token(
      accessToken: "1234",
    ));
  }

  Future<void> logout() {
    return Future.value();
  }
}
