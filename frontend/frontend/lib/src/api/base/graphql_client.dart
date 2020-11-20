import 'package:http/http.dart';

class GraphQLClient extends BaseClient {
  List<Interceptor> _interceptors = List();

  void addInterceptor(Interceptor interceptor) {
    _interceptors.add(interceptor);
  }

  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    if (_interceptors.isEmpty) {
      return request.send();
    }

    BaseRequest req = request;
    StreamedResponse response;
    for (var interceptor in _interceptors) {
      response = await interceptor.intercept(req);
      req = cloneRequest(req);
    }

    return response;
  }
}

BaseRequest cloneRequest(BaseRequest req) {
  if (req.finalized) {
    Request request = Request(req.method, req.url);
    request.headers.addAll(req.headers);
    request.persistentConnection = req.persistentConnection;
    request.followRedirects = req.followRedirects;
    request.maxRedirects = req.maxRedirects;
    if (req is Request) {
      request.body = req.body;
    }
    return request;
  }

  return req;
}

class GraphQLClientBuilder {
  GraphQLClient _client = GraphQLClient();

  GraphQLClientBuilder addInterceptor(Interceptor interceptor) {
    _client.addInterceptor(interceptor);
    return this;
  }

  GraphQLClient build() {
    return _client;
  }
}

abstract class Interceptor {
  Future<StreamedResponse> intercept(BaseRequest request);
}
