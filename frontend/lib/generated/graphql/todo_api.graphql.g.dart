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
    GetTodos$Query$Todo$UsersPermissionsUser instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('email', instance.email);
  return val;
}

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

Map<String, dynamic> _$GetTodos$Query$TodoToJson(GetTodos$Query$Todo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('done', instance.done);
  writeNotNull('author', instance.author?.toJson());
  return val;
}

GetTodos$Query _$GetTodos$QueryFromJson(Map<String, dynamic> json) {
  return GetTodos$Query()
    ..todos = (json['todos'] as List)
        ?.map((e) => e == null
            ? null
            : GetTodos$Query$Todo.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$GetTodos$QueryToJson(GetTodos$Query instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('todos', instance.todos?.map((e) => e?.toJson())?.toList());
  return val;
}

GetTodosArguments _$GetTodosArgumentsFromJson(Map<String, dynamic> json) {
  return GetTodosArguments(
    userId: json['userId'] as String,
  );
}

Map<String, dynamic> _$GetTodosArgumentsToJson(GetTodosArguments instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('userId', instance.userId);
  return val;
}

CreateTodo$Mutation$createTodoPayload$Todo$UsersPermissionsUser
    _$CreateTodo$Mutation$createTodoPayload$Todo$UsersPermissionsUserFromJson(
        Map<String, dynamic> json) {
  return CreateTodo$Mutation$createTodoPayload$Todo$UsersPermissionsUser()
    ..id = json['id'] as String;
}

Map<String, dynamic>
    _$CreateTodo$Mutation$createTodoPayload$Todo$UsersPermissionsUserToJson(
        CreateTodo$Mutation$createTodoPayload$Todo$UsersPermissionsUser
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

CreateTodo$Mutation$createTodoPayload$Todo
    _$CreateTodo$Mutation$createTodoPayload$TodoFromJson(
        Map<String, dynamic> json) {
  return CreateTodo$Mutation$createTodoPayload$Todo()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..done = json['done'] as bool
    ..author = json['author'] == null
        ? null
        : CreateTodo$Mutation$createTodoPayload$Todo$UsersPermissionsUser
            .fromJson(json['author'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CreateTodo$Mutation$createTodoPayload$TodoToJson(
    CreateTodo$Mutation$createTodoPayload$Todo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('done', instance.done);
  writeNotNull('author', instance.author?.toJson());
  return val;
}

CreateTodo$Mutation$createTodoPayload
    _$CreateTodo$Mutation$createTodoPayloadFromJson(Map<String, dynamic> json) {
  return CreateTodo$Mutation$createTodoPayload()
    ..todo = json['todo'] == null
        ? null
        : CreateTodo$Mutation$createTodoPayload$Todo.fromJson(
            json['todo'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CreateTodo$Mutation$createTodoPayloadToJson(
    CreateTodo$Mutation$createTodoPayload instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('todo', instance.todo?.toJson());
  return val;
}

CreateTodo$Mutation _$CreateTodo$MutationFromJson(Map<String, dynamic> json) {
  return CreateTodo$Mutation()
    ..createTodo = json['createTodo'] == null
        ? null
        : CreateTodo$Mutation$createTodoPayload.fromJson(
            json['createTodo'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CreateTodo$MutationToJson(CreateTodo$Mutation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('createTodo', instance.createTodo?.toJson());
  return val;
}

CreateTodoArguments _$CreateTodoArgumentsFromJson(Map<String, dynamic> json) {
  return CreateTodoArguments(
    name: json['name'] as String,
    done: json['done'] as bool,
    userId: json['userId'] as String,
  );
}

Map<String, dynamic> _$CreateTodoArgumentsToJson(CreateTodoArguments instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('done', instance.done);
  writeNotNull('userId', instance.userId);
  return val;
}

UpdateTodo$Mutation$updateTodoPayload$Todo$UsersPermissionsUser
    _$UpdateTodo$Mutation$updateTodoPayload$Todo$UsersPermissionsUserFromJson(
        Map<String, dynamic> json) {
  return UpdateTodo$Mutation$updateTodoPayload$Todo$UsersPermissionsUser()
    ..id = json['id'] as String
    ..email = json['email'] as String;
}

Map<String, dynamic>
    _$UpdateTodo$Mutation$updateTodoPayload$Todo$UsersPermissionsUserToJson(
        UpdateTodo$Mutation$updateTodoPayload$Todo$UsersPermissionsUser
            instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('email', instance.email);
  return val;
}

UpdateTodo$Mutation$updateTodoPayload$Todo
    _$UpdateTodo$Mutation$updateTodoPayload$TodoFromJson(
        Map<String, dynamic> json) {
  return UpdateTodo$Mutation$updateTodoPayload$Todo()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..done = json['done'] as bool
    ..author = json['author'] == null
        ? null
        : UpdateTodo$Mutation$updateTodoPayload$Todo$UsersPermissionsUser
            .fromJson(json['author'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UpdateTodo$Mutation$updateTodoPayload$TodoToJson(
    UpdateTodo$Mutation$updateTodoPayload$Todo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('done', instance.done);
  writeNotNull('author', instance.author?.toJson());
  return val;
}

UpdateTodo$Mutation$updateTodoPayload
    _$UpdateTodo$Mutation$updateTodoPayloadFromJson(Map<String, dynamic> json) {
  return UpdateTodo$Mutation$updateTodoPayload()
    ..todo = json['todo'] == null
        ? null
        : UpdateTodo$Mutation$updateTodoPayload$Todo.fromJson(
            json['todo'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UpdateTodo$Mutation$updateTodoPayloadToJson(
    UpdateTodo$Mutation$updateTodoPayload instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('todo', instance.todo?.toJson());
  return val;
}

UpdateTodo$Mutation _$UpdateTodo$MutationFromJson(Map<String, dynamic> json) {
  return UpdateTodo$Mutation()
    ..updateTodo = json['updateTodo'] == null
        ? null
        : UpdateTodo$Mutation$updateTodoPayload.fromJson(
            json['updateTodo'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UpdateTodo$MutationToJson(UpdateTodo$Mutation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('updateTodo', instance.updateTodo?.toJson());
  return val;
}

UpdateTodoArguments _$UpdateTodoArgumentsFromJson(Map<String, dynamic> json) {
  return UpdateTodoArguments(
    todoId: json['todoId'] as String,
    todoName: json['todoName'] as String,
    todoDone: json['todoDone'] as bool,
    authorId: json['authorId'] as String,
  );
}

Map<String, dynamic> _$UpdateTodoArgumentsToJson(UpdateTodoArguments instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('todoId', instance.todoId);
  writeNotNull('todoName', instance.todoName);
  writeNotNull('todoDone', instance.todoDone);
  writeNotNull('authorId', instance.authorId);
  return val;
}

DeleteTodo$Mutation$deleteTodoPayload$Todo
    _$DeleteTodo$Mutation$deleteTodoPayload$TodoFromJson(
        Map<String, dynamic> json) {
  return DeleteTodo$Mutation$deleteTodoPayload$Todo()
    ..id = json['id'] as String
    ..name = json['name'] as String;
}

Map<String, dynamic> _$DeleteTodo$Mutation$deleteTodoPayload$TodoToJson(
    DeleteTodo$Mutation$deleteTodoPayload$Todo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  return val;
}

DeleteTodo$Mutation$deleteTodoPayload
    _$DeleteTodo$Mutation$deleteTodoPayloadFromJson(Map<String, dynamic> json) {
  return DeleteTodo$Mutation$deleteTodoPayload()
    ..todo = json['todo'] == null
        ? null
        : DeleteTodo$Mutation$deleteTodoPayload$Todo.fromJson(
            json['todo'] as Map<String, dynamic>);
}

Map<String, dynamic> _$DeleteTodo$Mutation$deleteTodoPayloadToJson(
    DeleteTodo$Mutation$deleteTodoPayload instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('todo', instance.todo?.toJson());
  return val;
}

DeleteTodo$Mutation _$DeleteTodo$MutationFromJson(Map<String, dynamic> json) {
  return DeleteTodo$Mutation()
    ..deleteTodo = json['deleteTodo'] == null
        ? null
        : DeleteTodo$Mutation$deleteTodoPayload.fromJson(
            json['deleteTodo'] as Map<String, dynamic>);
}

Map<String, dynamic> _$DeleteTodo$MutationToJson(DeleteTodo$Mutation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('deleteTodo', instance.deleteTodo?.toJson());
  return val;
}

DeleteTodoArguments _$DeleteTodoArgumentsFromJson(Map<String, dynamic> json) {
  return DeleteTodoArguments(
    todoId: json['todoId'] as String,
  );
}

Map<String, dynamic> _$DeleteTodoArgumentsToJson(DeleteTodoArguments instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('todoId', instance.todoId);
  return val;
}
