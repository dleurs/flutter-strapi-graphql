// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTodos$Query$Todo$UsersPermissionsUser
    _$GetTodos$Query$Todo$UsersPermissionsUserFromJson(
        Map<String, dynamic> json) {
  return GetTodos$Query$Todo$UsersPermissionsUser()
    ..id = json['id'] as String
    ..email = json['email'] as String;
}

Map<String, dynamic> _$GetTodos$Query$Todo$UsersPermissionsUserToJson(
        GetTodos$Query$Todo$UsersPermissionsUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
    };

GetTodos$Query$Todo _$GetTodos$Query$TodoFromJson(Map<String, dynamic> json) {
  return GetTodos$Query$Todo()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..author = json['author'] == null
        ? null
        : GetTodos$Query$Todo$UsersPermissionsUser.fromJson(
            json['author'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetTodos$Query$TodoToJson(
        GetTodos$Query$Todo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'author': instance.author?.toJson(),
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

GetTodosArguments _$GetTodosArgumentsFromJson(Map<String, dynamic> json) {
  return GetTodosArguments(
    userId: json['userId'] as String,
  );
}

Map<String, dynamic> _$GetTodosArgumentsToJson(GetTodosArguments instance) =>
    <String, dynamic>{
      'userId': instance.userId,
    };
