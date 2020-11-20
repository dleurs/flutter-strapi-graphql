// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTodos$Query$Todo _$GetTodos$Query$TodoFromJson(Map<String, dynamic> json) {
  return GetTodos$Query$Todo()
    ..id = json['id'] as String
    ..name = json['name'] as String;
}

Map<String, dynamic> _$GetTodos$Query$TodoToJson(
        GetTodos$Query$Todo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

GetTodos$Query _$GetTodos$QueryFromJson(Map<String, dynamic> json) {
  return GetTodos$Query()
    ..todos = (json['todos'] as List)
        ?.map((e) => e == null
            ? null
            : GetTodos$Query$Todo.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$GetTodos$QueryToJson(GetTodos$Query instance) =>
    <String, dynamic>{
      'todos': instance.todos?.map((e) => e?.toJson())?.toList(),
    };
