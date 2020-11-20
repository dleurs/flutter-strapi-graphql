import 'package:artemis/client.dart';
import 'package:flutter/material.dart';
import 'package:frontend/config.dart';
import 'package:frontend/generated/graphql/authentication_api.graphql.dart';
import 'package:frontend/src/api/base/graphql_client.dart';
import 'package:frontend/src/api/interceptor/authorization_interceptor.dart';
import 'package:frontend/src/api/requests/is_email_exist_request.dart';
import 'package:frontend/src/api/requests/login_request.dart';
import 'package:frontend/src/models/authentication/token.dart';

class AuthenticationApiProvider {
  ArtemisClient get _client => ArtemisClient(Config.authApiEndpoint);

  // No token

  Future<bool> isEmailExist({@required String email}) {
    return IsEmailExistRequest(_client, email: email).call();
  }

  Future<Token> login({@required String email, @required String password}) {
    return LoginRequest(_client, email: email, password: password).call();
  }

  Future<void> logout() {
    return Future.value();
  }
}
