// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login$Mutation$UsersPermissionsLoginPayload
    _$Login$Mutation$UsersPermissionsLoginPayloadFromJson(
        Map<String, dynamic> json) {
  return Login$Mutation$UsersPermissionsLoginPayload()
    ..jwt = json['jwt'] as String;
}

Map<String, dynamic> _$Login$Mutation$UsersPermissionsLoginPayloadToJson(
        Login$Mutation$UsersPermissionsLoginPayload instance) =>
    <String, dynamic>{
      'jwt': instance.jwt,
    };

Login$Mutation _$Login$MutationFromJson(Map<String, dynamic> json) {
  return Login$Mutation()
    ..login = json['login'] == null
        ? null
        : Login$Mutation$UsersPermissionsLoginPayload.fromJson(
            json['login'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Login$MutationToJson(Login$Mutation instance) =>
    <String, dynamic>{
      'login': instance.login?.toJson(),
    };

LoginArguments _$LoginArgumentsFromJson(Map<String, dynamic> json) {
  return LoginArguments(
    email: json['email'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$LoginArgumentsToJson(LoginArguments instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

Register$Mutation$UsersPermissionsLoginPayload
    _$Register$Mutation$UsersPermissionsLoginPayloadFromJson(
        Map<String, dynamic> json) {
  return Register$Mutation$UsersPermissionsLoginPayload()
    ..jwt = json['jwt'] as String;
}

Map<String, dynamic> _$Register$Mutation$UsersPermissionsLoginPayloadToJson(
        Register$Mutation$UsersPermissionsLoginPayload instance) =>
    <String, dynamic>{
      'jwt': instance.jwt,
    };

Register$Mutation _$Register$MutationFromJson(Map<String, dynamic> json) {
  return Register$Mutation()
    ..register = json['register'] == null
        ? null
        : Register$Mutation$UsersPermissionsLoginPayload.fromJson(
            json['register'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Register$MutationToJson(Register$Mutation instance) =>
    <String, dynamic>{
      'register': instance.register?.toJson(),
    };

RegisterArguments _$RegisterArgumentsFromJson(Map<String, dynamic> json) {
  return RegisterArguments(
    email: json['email'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$RegisterArgumentsToJson(RegisterArguments instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

IsEmailExist$Query _$IsEmailExist$QueryFromJson(Map<String, dynamic> json) {
  return IsEmailExist$Query()..isEmailExist = json['isEmailExist'] as bool;
}

Map<String, dynamic> _$IsEmailExist$QueryToJson(IsEmailExist$Query instance) =>
    <String, dynamic>{
      'isEmailExist': instance.isEmailExist,
    };

IsEmailExistArguments _$IsEmailExistArgumentsFromJson(
    Map<String, dynamic> json) {
  return IsEmailExistArguments(
    email: json['email'] as String,
  );
}

Map<String, dynamic> _$IsEmailExistArgumentsToJson(
        IsEmailExistArguments instance) =>
    <String, dynamic>{
      'email': instance.email,
    };
