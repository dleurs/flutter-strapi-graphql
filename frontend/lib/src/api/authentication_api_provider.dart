import 'package:artemis/client.dart';
import 'package:flutter/material.dart';
import 'package:frontend/config.dart';
import 'package:frontend/generated/graphql/authentication_api.graphql.dart';
import 'package:frontend/src/api/requests/is_email_exist.dart';

class AuthenticationApiProvider {
  ArtemisClient get _client => ArtemisClient(Config.authApiEndpoint);

  //TODO httpClient: GraphQLClientBuilder().addInterceptor(interceptor));

  // localhost does not work on Android
  // https://stackoverflow.com/questions/60001536/flutter-socketexception-socketexception-os-error-connection-refused-errno

  Future<bool> isEmailExist({@required String email}) {
    return IsEmailExistRequest(_client, email: email).call();
  }
}
