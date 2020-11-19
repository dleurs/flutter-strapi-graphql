// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:meta/meta.dart';
import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'authentication_api.graphql.g.dart';

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
