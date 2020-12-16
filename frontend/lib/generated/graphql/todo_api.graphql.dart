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

  bool done;

  GetTodos$Query$Todo$UsersPermissionsUser author;

  @override
  List<Object> get props => [id, name, done, author];
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
                    name: NameNode(value: 'done'),
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

@JsonSerializable(explicitToJson: true)
class CreateTodo$Mutation$createTodoPayload$Todo$UsersPermissionsUser
    with EquatableMixin {
  CreateTodo$Mutation$createTodoPayload$Todo$UsersPermissionsUser();

  factory CreateTodo$Mutation$createTodoPayload$Todo$UsersPermissionsUser.fromJson(
          Map<String, dynamic> json) =>
      _$CreateTodo$Mutation$createTodoPayload$Todo$UsersPermissionsUserFromJson(
          json);

  String id;

  @override
  List<Object> get props => [id];
  Map<String, dynamic> toJson() =>
      _$CreateTodo$Mutation$createTodoPayload$Todo$UsersPermissionsUserToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class CreateTodo$Mutation$createTodoPayload$Todo with EquatableMixin {
  CreateTodo$Mutation$createTodoPayload$Todo();

  factory CreateTodo$Mutation$createTodoPayload$Todo.fromJson(
          Map<String, dynamic> json) =>
      _$CreateTodo$Mutation$createTodoPayload$TodoFromJson(json);

  String id;

  String name;

  bool done;

  CreateTodo$Mutation$createTodoPayload$Todo$UsersPermissionsUser author;

  @override
  List<Object> get props => [id, name, done, author];
  Map<String, dynamic> toJson() =>
      _$CreateTodo$Mutation$createTodoPayload$TodoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateTodo$Mutation$createTodoPayload with EquatableMixin {
  CreateTodo$Mutation$createTodoPayload();

  factory CreateTodo$Mutation$createTodoPayload.fromJson(
          Map<String, dynamic> json) =>
      _$CreateTodo$Mutation$createTodoPayloadFromJson(json);

  CreateTodo$Mutation$createTodoPayload$Todo todo;

  @override
  List<Object> get props => [todo];
  Map<String, dynamic> toJson() =>
      _$CreateTodo$Mutation$createTodoPayloadToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateTodo$Mutation with EquatableMixin {
  CreateTodo$Mutation();

  factory CreateTodo$Mutation.fromJson(Map<String, dynamic> json) =>
      _$CreateTodo$MutationFromJson(json);

  CreateTodo$Mutation$createTodoPayload createTodo;

  @override
  List<Object> get props => [createTodo];
  Map<String, dynamic> toJson() => _$CreateTodo$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateTodoArguments extends JsonSerializable with EquatableMixin {
  CreateTodoArguments({@required this.name, this.done, @required this.userId});

  factory CreateTodoArguments.fromJson(Map<String, dynamic> json) =>
      _$CreateTodoArgumentsFromJson(json);

  final String name;

  final bool done;

  final String userId;

  @override
  List<Object> get props => [name, done, userId];
  Map<String, dynamic> toJson() => _$CreateTodoArgumentsToJson(this);
}

class CreateTodoMutation
    extends GraphQLQuery<CreateTodo$Mutation, CreateTodoArguments> {
  CreateTodoMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'createTodo'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'name')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'done')),
              type: NamedTypeNode(
                  name: NameNode(value: 'Boolean'), isNonNull: false),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'userId')),
              type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'createTodo'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'input'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                          name: NameNode(value: 'data'),
                          value: ObjectValueNode(fields: [
                            ObjectFieldNode(
                                name: NameNode(value: 'name'),
                                value: VariableNode(
                                    name: NameNode(value: 'name'))),
                            ObjectFieldNode(
                                name: NameNode(value: 'done'),
                                value: VariableNode(
                                    name: NameNode(value: 'done'))),
                            ObjectFieldNode(
                                name: NameNode(value: 'author'),
                                value: VariableNode(
                                    name: NameNode(value: 'userId')))
                          ]))
                    ]))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'todo'),
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
                          name: NameNode(value: 'name'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'done'),
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
                                selectionSet: null)
                          ]))
                    ]))
              ]))
        ]))
  ]);

  @override
  final String operationName = 'createTodo';

  @override
  final CreateTodoArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  CreateTodo$Mutation parse(Map<String, dynamic> json) =>
      CreateTodo$Mutation.fromJson(json);
}
