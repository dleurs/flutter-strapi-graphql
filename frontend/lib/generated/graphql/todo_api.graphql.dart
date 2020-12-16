// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:meta/meta.dart';
import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'todo_api.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class GetTodos$Query$Todo$UsersPermissionsUser with EquatableMixin {
  GetTodos$Query$Todo$UsersPermissionsUser();

  factory GetTodos$Query$Todo$UsersPermissionsUser.fromJson(
          Map<String, dynamic> json) =>
      _$GetTodos$Query$Todo$UsersPermissionsUserFromJson(json);

  String id;

  String email;

  @override
  List<Object> get props => [id, email];
  Map<String, dynamic> toJson() =>
      _$GetTodos$Query$Todo$UsersPermissionsUserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetTodos$Query$Todo with EquatableMixin {
  GetTodos$Query$Todo();

  factory GetTodos$Query$Todo.fromJson(Map<String, dynamic> json) =>
      _$GetTodos$Query$TodoFromJson(json);

  String id;

  String name;

  GetTodos$Query$Todo$UsersPermissionsUser author;

  @override
  List<Object> get props => [id, name, author];
  Map<String, dynamic> toJson() => _$GetTodos$Query$TodoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetTodos$Query with EquatableMixin {
  GetTodos$Query();

  factory GetTodos$Query.fromJson(Map<String, dynamic> json) =>
      _$GetTodos$QueryFromJson(json);

  List<GetTodos$Query$Todo> todos;

  @override
  List<Object> get props => [todos];
  Map<String, dynamic> toJson() => _$GetTodos$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetTodosArguments extends JsonSerializable with EquatableMixin {
  GetTodosArguments({@required this.userId});

  factory GetTodosArguments.fromJson(Map<String, dynamic> json) =>
      _$GetTodosArgumentsFromJson(json);

  final String userId;

  @override
  List<Object> get props => [userId];
  Map<String, dynamic> toJson() => _$GetTodosArgumentsToJson(this);
}

class GetTodosQuery extends GraphQLQuery<GetTodos$Query, GetTodosArguments> {
  GetTodosQuery({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'getTodos'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'userId')),
              type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'todos'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'where'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                          name: NameNode(value: 'author'),
                          value: VariableNode(name: NameNode(value: 'userId')))
                    ]))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'name'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'author'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'id'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'email'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null)
                    ]))
              ]))
        ]))
  ]);

  @override
  final String operationName = 'getTodos';

  @override
  final GetTodosArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  GetTodos$Query parse(Map<String, dynamic> json) =>
      GetTodos$Query.fromJson(json);
}
