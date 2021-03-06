import 'package:artemis/client.dart';
import 'package:artemis/schema/graphql_query.dart';
import 'package:flutter/material.dart';
import 'package:frontend/generated/graphql/authentication_api.graphql.dart';
import 'package:frontend/src/api/base/request_errors.dart';
import 'package:frontend/src/api/errors/user.dart';
import 'package:frontend/src/api/requests/request_utils.dart';
import 'package:json_annotation/src/json_serializable.dart';

import 'package:frontend/src/api/base/graphql_request.dart';

class IsEmailExistRequest extends GraphQLRequest<bool, IsEmailExist$Query> {
  final String email;
  IsEmailExistRequest(ArtemisClient client, {@required this.email})
      : super(client);

  @override
  GraphQLQuery<IsEmailExist$Query, JsonSerializable> buildQuery() {
    return IsEmailExistQuery(variables: IsEmailExistArguments(email: email));
  }

  @override
  bool buildResponse(IsEmailExist$Query data) {
    return data.isEmailExist;
  }

  @override
  RequestException processErrors(List<RequestError> errors) {
    if (RequestUtils.hasErrorCode(errors, ErrorCodes.INTERNAL_SERVER_ERROR) &&
        RequestUtils.hasErrorMessage(errors, ErrorMessages.FORBIDDEN)) {
      return BackendErrorNoPermissionException();
    }
    return UserRequestFailedException(errors);
  }
}
