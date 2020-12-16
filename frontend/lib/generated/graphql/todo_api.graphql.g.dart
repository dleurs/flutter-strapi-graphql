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
    ..done = json['done'] as bool
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
      'done': instance.done,
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

CreateTodo$Mutation$createTodoPayload$Todo$UsersPermissionsUser
    _$CreateTodo$Mutation$createTodoPayload$Todo$UsersPermissionsUserFromJson(
        Map<String, dynamic> json) {
  return CreateTodo$Mutation$createTodoPayload$Todo$UsersPermissionsUser()
    ..id = json['id'] as String;
}

Map<String, dynamic>
    _$CreateTodo$Mutation$createTodoPayload$Todo$UsersPermissionsUserToJson(
            CreateTodo$Mutation$createTodoPayload$Todo$UsersPermissionsUser
                instance) =>
        <String, dynamic>{
          'id': instance.id,
        };

CreateTodo$Mutation$createTodoPayload$Todo
    _$CreateTodo$Mutation$createTodoPayload$TodoFromJson(
        Map<String, dynamic> json) {
  return CreateTodo$Mutation$createTodoPayload$Todo()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..author = json['author'] == null
        ? null
        : CreateTodo$Mutation$createTodoPayload$Todo$UsersPermissionsUser
            .fromJson(json['author'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CreateTodo$Mutation$createTodoPayload$TodoToJson(
        CreateTodo$Mutation$createTodoPayload$Todo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'author': instance.author?.toJson(),
    };

CreateTodo$Mutation$createTodoPayload
    _$CreateTodo$Mutation$createTodoPayloadFromJson(Map<String, dynamic> json) {
  return CreateTodo$Mutation$createTodoPayload()
    ..todo = json['todo'] == null
        ? null
        : CreateTodo$Mutation$createTodoPayload$Todo.fromJson(
            json['todo'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CreateTodo$Mutation$createTodoPayloadToJson(
        CreateTodo$Mutation$createTodoPayload instance) =>
    <String, dynamic>{
      'todo': instance.todo?.toJson(),
    };

CreateTodo$Mutation _$CreateTodo$MutationFromJson(Map<String, dynamic> json) {
  return CreateTodo$Mutation()
    ..createTodo = json['createTodo'] == null
        ? null
        : CreateTodo$Mutation$createTodoPayload.fromJson(
            json['createTodo'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CreateTodo$MutationToJson(
        CreateTodo$Mutation instance) =>
    <String, dynamic>{
      'createTodo': instance.createTodo?.toJson(),
    };

CreateTodoArguments _$CreateTodoArgumentsFromJson(Map<String, dynamic> json) {
  return CreateTodoArguments(
    name: json['name'] as String,
    done: json['done'] as bool,
    userId: json['userId'] as String,
  );
}

Map<String, dynamic> _$CreateTodoArgumentsToJson(
        CreateTodoArguments instance) =>
    <String, dynamic>{
      'name': instance.name,
      'done': instance.done,
      'userId': instance.userId,
    };
