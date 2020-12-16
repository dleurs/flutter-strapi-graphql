import 'package:frontend/src/models/user.dart';

class Todo {
  String id;
  String name;
  bool done;
  User author;
  Todo({this.id, this.name, this.done, this.author});
}
