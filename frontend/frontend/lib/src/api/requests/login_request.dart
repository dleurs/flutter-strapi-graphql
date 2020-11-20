import 'package:artemis/client.dart';
import 'package:artemis/schema/graphql_query.dart';
import 'package:flutter/material.dart';
import 'package:frontend/generated/graphql/authentication_api.graphql.dart';
import 'package:frontend/src/models/authentication/token.dart';
import 'package:json_annotation/src/json_serializable.dart';

import 'package:frontend/src/api/base/graphql_request.dart';

class LoginRequest extends GraphQLRequest<Token, Login$Mutation> {
  final String email;
  final String password;
  LoginRequest(ArtemisClient client,
      {@required this.email, @required this.password})
      : super(client);

  @override
  GraphQLQuery<Login$Mutation, JsonSerializable> buildQuery() {
    return LoginMutation(
        variables: LoginArguments(email: email, password: password));
  }

  @override
  Token buildResponse(Login$Mutation data) {
    return Token(accessToken: data.login.jwt);
  }
}
