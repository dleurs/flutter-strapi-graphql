import 'dart:async';
import 'dart:convert';

import 'package:artemis/artemis.dart';
import 'package:frontend/config.dart';
import 'package:frontend/src/api/base/graphql_client.dart';
import 'package:frontend/src/api/base/request_errors.dart';
import 'package:frontend/src/api/errors/user.dart';
import 'package:frontend/src/api/requests/login_request.dart';
import 'package:frontend/src/core/authentication/authentication_manager.dart';
import 'package:frontend/src/helpers/log.dart';
import 'package:frontend/src/models/authentication/token.dart';
import 'package:http/io_client.dart';
import 'package:http/src/base_request.dart';
import 'package:http/src/streamed_response.dart';

class AuthorizationInterceptor implements Interceptor {
  static const String _authorizationKey = "Authorization";
  ArtemisClient get _client => ArtemisClient(Config.authApiEndpoint);

  @override
  Future<StreamedResponse> intercept(BaseRequest request) async {
    Token tokenObj = AuthenticationManager.instance.token;
    if (tokenObj == null) {
      tokenObj = await getToken();
      await AuthenticationManager.instance.updateCredentials(token: tokenObj);
    }

    addTokenToRequest(request, tokenObj);
    StreamedResponse response = await request.send();

    String responseBody = await response.stream.bytesToString();
    Log.debug(
        "Interceptor: Response status is ${response.statusCode} and body is ${responseBody}");

/*     if (responseBody.contains(ErrorCodes.LOGIN_REQUIRED)) {
      Log.debug("Interceptor: refresh token needed");
      tokenObj = await refreshToken(tokenObj.refreshToken);
      await AuthenticationManager.instance.updateCredentials(token: tokenObj);
      BaseRequest req = cloneRequest(request);
      addTokenToRequest(req, tokenObj);
      return req.send();
    } */

    return Future.value(_rebuildResponse(responseBody));
  }

  Future<Token> getToken() async {
    if (AuthenticationManager.instance.isLoggedIn) {
      String login = AuthenticationManager.instance.login;
      String password = AuthenticationManager.instance.password;
      return LoginRequest(_client, email: login, password: password).call();
    } else {
      throw LoginFailedException();
    }
  }

/*   Future<Token> refreshToken(String refreshToken) async {
    return RefreshTokenRequest(_client, refreshToken: refreshToken).call();
  } */

  ///
  /// Add Authorization header to the request
  ///
  void addTokenToRequest(BaseRequest request, Token token) {
    request.headers.update(_authorizationKey, (_) => _formatToken(token),
        ifAbsent: () => _formatToken(token));
  }

  String _formatToken(Token token) {
    return "Bearer ${token.accessToken}";
  }

  FutureOr<StreamedResponse> _rebuildResponse(String responseBody) {
    return IOStreamedResponse(
        Stream.fromFuture(Future.value(utf8.encode(responseBody))), 200);
  }
}
