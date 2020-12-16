class User {
  String id;
  String email;
  User({this.id, this.email});

  String toString() {
    String str = "User{";
    str += "id:" + (id ?? "null") + ", ";
    str += "name:" + (email ?? "null");
    str += "}";
    return str;
  }
}
