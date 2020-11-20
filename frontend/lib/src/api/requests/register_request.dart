import 'package:artemis/client.dart';
import 'package:artemis/schema/graphql_query.dart';
import 'package:flutter/material.dart';
import 'package:frontend/generated/graphql/authentication_api.graphql.dart';
import 'package:frontend/src/models/authentication/token.dart';
import 'package:json_annotation/src/json_serializable.dart';

import 'package:frontend/src/api/base/graphql_request.dart';

class RegisterRequest extends GraphQLRequest<Token, Register$Mutation> {
  final String email;
  final String password;
  RegisterRequest(ArtemisClient client,
      {@required this.email, @required this.password})
      : super(client);

  @override
  GraphQLQuery<Register$Mutation, JsonSerializable> buildQuery() {
    return RegisterMutation(
        variables: RegisterArguments(email: email, password: password));
  }

  @override
  Token buildResponse(Register$Mutation data) {
    return Token(accessToken: data.register.jwt);
  }
}
