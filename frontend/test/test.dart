import 'package:frontend/src/api/authentication_api_provider.dart';

void main() async {
  print('Hello, World!');
  bool isEmailExist =
      await AuthenticationApiProvider().isEmailExist(email: "non");
  print(isEmailExist.toString());
}
