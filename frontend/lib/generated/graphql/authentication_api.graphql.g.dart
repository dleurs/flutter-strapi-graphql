// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
