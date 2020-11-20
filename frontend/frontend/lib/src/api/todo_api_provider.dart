import 'package:artemis/client.dart';
import 'package:frontend/config.dart';
import 'package:frontend/src/api/requests/get_todos_request.dart';
import 'package:frontend/src/models/todo.dart';

class TodoApiProvider {
  ArtemisClient get client => ArtemisClient(Config.authApiEndpoint);

  //TODO httpClient: GraphQLClientBuilder().addInterceptor(interceptor));

  // localhost does not work on Android
  // https://stackoverflow.com/questions/60001536/flutter-socketexception-socketexception-os-error-connection-refused-errno

  Future<List<Todo>> getTodos() {
    return GetTodosRequest(client).call();
  }
}
