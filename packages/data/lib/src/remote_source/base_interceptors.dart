import 'package:dio/dio.dart';

class BaseInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    // Add common headers
    options.headers.addAll({
      'Accept': 'application/json',
      'Requested-From': 'mobile',
    });

    handler.next(options); // Continue the request
  }

  @override
  Future<void> onResponse(
      Response response,
      ResponseInterceptorHandler handler,
      ) async {
    // Log response
    print('Response: ${response.statusCode} ${response.data}');
    handler.next(response); // Continue the response
  }

  @override
  Future<void> onError(
      DioException err,
      ErrorInterceptorHandler handler,
      ) async {
    // Log error
    print('Error: ${err.message}');
    handler.next(err); // Continue error handling
  }
}
