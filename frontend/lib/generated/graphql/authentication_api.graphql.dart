// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:meta/meta.dart';
import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'authentication_api.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Login$Mutation$UsersPermissionsLoginPayload$UsersPermissionsMe
    with EquatableMixin {
  Login$Mutation$UsersPermissionsLoginPayload$UsersPermissionsMe();

  factory Login$Mutation$UsersPermissionsLoginPayload$UsersPermissionsMe.fromJson(
          Map<String, dynamic> json) =>
      _$Login$Mutation$UsersPermissionsLoginPayload$UsersPermissionsMeFromJson(
          json);

  String id;

  @override
  List<Object> get props => [id];
  Map<String, dynamic> toJson() =>
      _$Login$Mutation$UsersPermissionsLoginPayload$UsersPermissionsMeToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class Login$Mutation$UsersPermissionsLoginPayload with EquatableMixin {
  Login$Mutation$UsersPermissionsLoginPayload();

  factory Login$Mutation$UsersPermissionsLoginPayload.fromJson(
          Map<String, dynamic> json) =>
      _$Login$Mutation$UsersPermissionsLoginPayloadFromJson(json);

  String jwt;

  Login$Mutation$UsersPermissionsLoginPayload$UsersPermissionsMe user;

  @override
  List<Object> get props => [jwt, user];
  Map<String, dynamic> toJson() =>
      _$Login$Mutation$UsersPermissionsLoginPayloadToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Login$Mutation with EquatableMixin {
  Login$Mutation();

  factory Login$Mutation.fromJson(Map<String, dynamic> json) =>
      _$Login$MutationFromJson(json);

  Login$Mutation$UsersPermissionsLoginPayload login;

  @override
  List<Object> get props => [login];
  Map<String, dynamic> toJson() => _$Login$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LoginArguments extends JsonSerializable with EquatableMixin {
  LoginArguments({@required this.email, @required this.password});

  factory LoginArguments.fromJson(Map<String, dynamic> json) =>
      _$LoginArgumentsFromJson(json);

  final String email;

  final String password;

  @override
  List<Object> get props => [email, password];
  Map<String, dynamic> toJson() => _$LoginArgumentsToJson(this);
}

class LoginMutation extends GraphQLQuery<Login$Mutation, LoginArguments> {
  LoginMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'login'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'email')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'password')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'login'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'input'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                          name: NameNode(value: 'identifier'),
                          value: VariableNode(name: NameNode(value: 'email'))),
                      ObjectFieldNode(
                          name: NameNode(value: 'password'),
                          value:
                              VariableNode(name: NameNode(value: 'password')))
                    ]))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'jwt'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'user'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'id'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null)
                    ]))
              ]))
        ]))
  ]);

  @override
  final String operationName = 'login';

  @override
  final LoginArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  Login$Mutation parse(Map<String, dynamic> json) =>
      Login$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class Register$Mutation$UsersPermissionsLoginPayload$UsersPermissionsMe
    with EquatableMixin {
  Register$Mutation$UsersPermissionsLoginPayload$UsersPermissionsMe();

  factory Register$Mutation$UsersPermissionsLoginPayload$UsersPermissionsMe.fromJson(
          Map<String, dynamic> json) =>
      _$Register$Mutation$UsersPermissionsLoginPayload$UsersPermissionsMeFromJson(
          json);

  String id;

  @override
  List<Object> get props => [id];
  Map<String, dynamic> toJson() =>
      _$Register$Mutation$UsersPermissionsLoginPayload$UsersPermissionsMeToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class Register$Mutation$UsersPermissionsLoginPayload with EquatableMixin {
  Register$Mutation$UsersPermissionsLoginPayload();

  factory Register$Mutation$UsersPermissionsLoginPayload.fromJson(
          Map<String, dynamic> json) =>
      _$Register$Mutation$UsersPermissionsLoginPayloadFromJson(json);

  String jwt;

  Register$Mutation$UsersPermissionsLoginPayload$UsersPermissionsMe user;

  @override
  List<Object> get props => [jwt, user];
  Map<String, dynamic> toJson() =>
      _$Register$Mutation$UsersPermissionsLoginPayloadToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Register$Mutation with EquatableMixin {
  Register$Mutation();

  factory Register$Mutation.fromJson(Map<String, dynamic> json) =>
      _$Register$MutationFromJson(json);

  Register$Mutation$UsersPermissionsLoginPayload register;

  @override
  List<Object> get props => [register];
  Map<String, dynamic> toJson() => _$Register$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RegisterArguments extends JsonSerializable with EquatableMixin {
  RegisterArguments({@required this.email, @required this.password});

  factory RegisterArguments.fromJson(Map<String, dynamic> json) =>
      _$RegisterArgumentsFromJson(json);

  final String email;

  final String password;

  @override
  List<Object> get props => [email, password];
  Map<String, dynamic> toJson() => _$RegisterArgumentsToJson(this);
}

class RegisterMutation
    extends GraphQLQuery<Register$Mutation, RegisterArguments> {
  RegisterMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'register'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'email')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'password')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'register'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'input'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                          name: NameNode(value: 'email'),
                          value: VariableNode(name: NameNode(value: 'email'))),
                      ObjectFieldNode(
                          name: NameNode(value: 'username'),
                          value: VariableNode(name: NameNode(value: 'email'))),
                      ObjectFieldNode(
                          name: NameNode(value: 'password'),
                          value:
                              VariableNode(name: NameNode(value: 'password')))
                    ]))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'jwt'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'user'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'id'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null)
                    ]))
              ]))
        ]))
  ]);

  @override
  final String operationName = 'register';

  @override
  final RegisterArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  Register$Mutation parse(Map<String, dynamic> json) =>
      Register$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class IsEmailExist$Query with EquatableMixin {
  IsEmailExist$Query();

  factory IsEmailExist$Query.fromJson(Map<String, dynamic> json) =>
      _$IsEmailExist$QueryFromJson(json);

  bool isEmailExist;

  @override
  List<Object> get props => [isEmailExist];
  Map<String, dynamic> toJson() => _$IsEmailExist$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class IsEmailExistArguments extends JsonSerializable with EquatableMixin {
  IsEmailExistArguments({@required this.email});

  factory IsEmailExistArguments.fromJson(Map<String, dynamic> json) =>
      _$IsEmailExistArgumentsFromJson(json);

  final String email;

  @override
  List<Object> get props => [email];
  Map<String, dynamic> toJson() => _$IsEmailExistArgumentsToJson(this);
}

class IsEmailExistQuery
    extends GraphQLQuery<IsEmailExist$Query, IsEmailExistArguments> {
  IsEmailExistQuery({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'isEmailExist'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'email')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'isEmailExist'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'email'),
                    value: VariableNode(name: NameNode(value: 'email')))
              ],
              directives: [],
              selectionSet: null)
        ]))
  ]);

  @override
  final String operationName = 'isEmailExist';

  @override
  final IsEmailExistArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  IsEmailExist$Query parse(Map<String, dynamic> json) =>
      IsEmailExist$Query.fromJson(json);
}
