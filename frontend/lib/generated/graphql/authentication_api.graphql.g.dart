// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login$Mutation$UsersPermissionsLoginPayload$UsersPermissionsMe
    _$Login$Mutation$UsersPermissionsLoginPayload$UsersPermissionsMeFromJson(
        Map<String, dynamic> json) {
  return Login$Mutation$UsersPermissionsLoginPayload$UsersPermissionsMe()
    ..id = json['id'] as String;
}

Map<String, dynamic>
    _$Login$Mutation$UsersPermissionsLoginPayload$UsersPermissionsMeToJson(
        Login$Mutation$UsersPermissionsLoginPayload$UsersPermissionsMe
            instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  return val;
}

Login$Mutation$UsersPermissionsLoginPayload
    _$Login$Mutation$UsersPermissionsLoginPayloadFromJson(
        Map<String, dynamic> json) {
  return Login$Mutation$UsersPermissionsLoginPayload()
    ..jwt = json['jwt'] as String
    ..user = json['user'] == null
        ? null
        : Login$Mutation$UsersPermissionsLoginPayload$UsersPermissionsMe
            .fromJson(json['user'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Login$Mutation$UsersPermissionsLoginPayloadToJson(
    Login$Mutation$UsersPermissionsLoginPayload instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('jwt', instance.jwt);
  writeNotNull('user', instance.user?.toJson());
  return val;
}

Login$Mutation _$Login$MutationFromJson(Map<String, dynamic> json) {
  return Login$Mutation()
    ..login = json['login'] == null
        ? null
        : Login$Mutation$UsersPermissionsLoginPayload.fromJson(
            json['login'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Login$MutationToJson(Login$Mutation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('login', instance.login?.toJson());
  return val;
}

LoginArguments _$LoginArgumentsFromJson(Map<String, dynamic> json) {
  return LoginArguments(
    email: json['email'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$LoginArgumentsToJson(LoginArguments instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', instance.email);
  writeNotNull('password', instance.password);
  return val;
}

Register$Mutation$UsersPermissionsLoginPayload$UsersPermissionsMe
    _$Register$Mutation$UsersPermissionsLoginPayload$UsersPermissionsMeFromJson(
        Map<String, dynamic> json) {
  return Register$Mutation$UsersPermissionsLoginPayload$UsersPermissionsMe()
    ..id = json['id'] as String;
}

Map<String, dynamic>
    _$Register$Mutation$UsersPermissionsLoginPayload$UsersPermissionsMeToJson(
        Register$Mutation$UsersPermissionsLoginPayload$UsersPermissionsMe
            instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  return val;
}

Register$Mutation$UsersPermissionsLoginPayload
    _$Register$Mutation$UsersPermissionsLoginPayloadFromJson(
        Map<String, dynamic> json) {
  return Register$Mutation$UsersPermissionsLoginPayload()
    ..jwt = json['jwt'] as String
    ..user = json['user'] == null
        ? null
        : Register$Mutation$UsersPermissionsLoginPayload$UsersPermissionsMe
            .fromJson(json['user'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Register$Mutation$UsersPermissionsLoginPayloadToJson(
    Register$Mutation$UsersPermissionsLoginPayload instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('jwt', instance.jwt);
  writeNotNull('user', instance.user?.toJson());
  return val;
}

Register$Mutation _$Register$MutationFromJson(Map<String, dynamic> json) {
  return Register$Mutation()
    ..register = json['register'] == null
        ? null
        : Register$Mutation$UsersPermissionsLoginPayload.fromJson(
            json['register'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Register$MutationToJson(Register$Mutation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('register', instance.register?.toJson());
  return val;
}

RegisterArguments _$RegisterArgumentsFromJson(Map<String, dynamic> json) {
  return RegisterArguments(
    email: json['email'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$RegisterArgumentsToJson(RegisterArguments instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', instance.email);
  writeNotNull('password', instance.password);
  return val;
}

IsEmailExist$Query _$IsEmailExist$QueryFromJson(Map<String, dynamic> json) {
  return IsEmailExist$Query()..isEmailExist = json['isEmailExist'] as bool;
}

Map<String, dynamic> _$IsEmailExist$QueryToJson(IsEmailExist$Query instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('isEmailExist', instance.isEmailExist);
  return val;
}

IsEmailExistArguments _$IsEmailExistArgumentsFromJson(
    Map<String, dynamic> json) {
  return IsEmailExistArguments(
    email: json['email'] as String,
  );
}

Map<String, dynamic> _$IsEmailExistArgumentsToJson(
    IsEmailExistArguments instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', instance.email);
  return val;
}
