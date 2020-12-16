import 'package:frontend/src/models/user.dart';

class Todo {
  String id;
  String name;
  bool done;
  User author;
  Todo({this.id, this.name, this.done, this.author});

  String toString() {
    String str = "Todo{";
    str += "id:" + (id ?? "null") + ", ";
    str += "name:" + (name ?? "null") + ", ";
    str += "done:" + (done?.toString() ?? "null") + ", ";
    str += "author:" + (author?.toString() ?? "null");
    str += "}";
    return str;
  }
}
