import 'package:frontend/src/models/user.dart';

class Todo {
  String id;
  String name;
  bool done;
  User author;
  Todo({this.id, this.name, this.done, this.author});

  String toString() {
    String str = "Todo{";
    str += "if:" + id + ", ";
    str += "name:" + name + ", ";
    str += "done:" + done.toString() + ", ";
    str += "author:" + author.toString();
    str += "}";
    return str;
  }
}
