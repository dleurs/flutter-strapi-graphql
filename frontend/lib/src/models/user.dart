class User {
  String id;
  String email;
  User({this.id, this.email});

  String toString() {
    String str = "User{";
    str += "if:" + (id ?? "null") + ", ";
    str += "name:" + (email ?? "null");
    str += "}";
    return str;
  }
}
