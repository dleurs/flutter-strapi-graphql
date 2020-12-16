class User {
  String id;
  String email;
  User({this.id, this.email});

  String toString() {
    String str = "User{";
    str += "if:" + id + ", ";
    str += "name:" + email;
    str += "}";
    return str;
  }
}
