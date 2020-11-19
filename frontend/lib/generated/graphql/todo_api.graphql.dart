// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:meta/meta.dart';
import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'todo_api.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class GetTodos$Query$Todo with EquatableMixin {
  GetTodos$Query$Todo();

  factory GetTodos$Query$Todo.fromJson(Map<String, dynamic> json) =>
      _$GetTodos$Query$TodoFromJson(json);

  String id;

  String name;

  @override
  List<Object> get props => [id, name];
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

class GetTodosQuery extends GraphQLQuery<GetTodos$Query, JsonSerializable> {
  GetTodosQuery();

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'getTodos'),
        variableDefinitions: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'todos'),
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
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'getTodos';

  @override
  List<Object> get props => [document, operationName];
  @override
  GetTodos$Query parse(Map<String, dynamic> json) =>
      GetTodos$Query.fromJson(json);
}
