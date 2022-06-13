part of 'app.dart';

class _ApiInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String token = await user.getIdToken();
      options.headers['Authorization'] = 'Bearer $token';
    }

    if (options.data is FormData) {
      options.headers['Content-Type'] = 'multipart/form-data';
    } else {
      options.headers['Content-Type'] = 'application/json';
    }

    log(options.data.toString(), name: 'Request - ${options.uri.path}');

    super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    log(response.data.toString(), name: 'Response - ${response.realUri.path}');

    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log((err.response?.data).toString(),
        name: 'Response Error - ${err.response?.realUri.path}');

    throw err;
  }
}

class Api {
  static Api? _api;

  Api._();

  static Api get _instance => _api ??= Api._();

  Dio _init(Config config) {
    Dio client = Dio();
    client.options.baseUrl = Uri.https(config.host, '').toString();
    client.interceptors.add(_ApiInterceptor());

    return client;
  }
}
