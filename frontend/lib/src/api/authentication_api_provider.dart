import 'package:artemis/client.dart';
import 'package:flutter/material.dart';
import 'package:frontend/config.dart';
import 'package:frontend/src/api/requests/is_email_exist_request.dart';
import 'package:frontend/src/api/requests/login_request.dart';
import 'package:frontend/src/api/requests/register_request.dart';
import 'package:frontend/src/models/authentication/token.dart';
import 'package:tuple/tuple.dart';

class AuthenticationApiProvider {
  ArtemisClient get _client => ArtemisClient(Config.authApiEndpoint);

  // No token

  Future<bool> isEmailExist({@required String email}) {
    return IsEmailExistRequest(_client, email: email).call();
  }

  Future<Tuple2<Token, String>> login(
      {@required String email, @required String password}) {
    return LoginRequest(_client, email: email, password: password).call();
  }

  Future<Tuple2<Token, String>> register(
      {@required String email, @required String password}) {
    return RegisterRequest(_client, email: email, password: password).call();
  }

  Future<void> logout() {
    return Future.value();
  }
}
