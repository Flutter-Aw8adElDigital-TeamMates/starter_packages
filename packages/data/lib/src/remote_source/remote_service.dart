import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:security/security.dart';
import '../models/remote_response.dart';

class RemoteService {
  final Dio _dio;


  RemoteService(
     Dio dio,{
    bool enableSSLPinning = false,
    List<String>? sslCertificates,
  })  : _dio = dio {
    if (enableSSLPinning && sslCertificates != null) {
      _applySSLPinning(sslCertificates);
    }
  }
  void _applySSLPinning(List<String> sslCertificates) {
    final logger = LoggerFactory.logger;
    try {
      logger.info('Applying SSL pinning...');
      AppSecurity().applySSLPinning(sslCertificates, _dio);
      logger.info('SSL pinning applied successfully.');
    } catch (e) {
      logger.error('Failed to apply SSL pinning.', error: e);
    }
  }
  // === HTTP METHODS === //

  Future<RemoteResponse<T>> get<T>(
      String url, {
        Map<String, dynamic>? queryParameters,
        Map<String, String>? headers,
        String? errorFieldKey,
      }) async {
    return _performRequest<T>(
      method: 'GET',
      url: url,
      queryParameters: queryParameters,
      headers: headers,
        errorFieldKey:errorFieldKey
    );
  }

  Future<RemoteResponse<T>> post<T>(
      String url, {
        dynamic body,
        Map<String, dynamic>? queryParameters,
        Map<String, String>? headers,
        bool isFormUrlEncoded = false,
        String? errorFieldKey,
      }) async {
    return _performRequest<T>(
      method: 'POST',
      url: url,
      data: isFormUrlEncoded ? _prepareFormData(body) : body,
      queryParameters: queryParameters,
      headers: headers,
      isFormUrlEncoded: isFormUrlEncoded,
        errorFieldKey:errorFieldKey
    );
  }

  Future<RemoteResponse<T>> put<T>(
      String url, {
        dynamic body,
        Map<String, dynamic>? queryParameters,
        Map<String, String>? headers,
        bool isFormUrlEncoded = false,
        String? errorFieldKey,
      }) async {
    return _performRequest<T>(
      method: 'PUT',
      url: url,
      data: isFormUrlEncoded ? _prepareFormData(body) : body,
      queryParameters: queryParameters,
      headers: headers,
      isFormUrlEncoded: isFormUrlEncoded,
        errorFieldKey:errorFieldKey
    );
  }

  Future<RemoteResponse<T>> patch<T>(
      String url, {
        dynamic body,
        Map<String, dynamic>? queryParameters,
        Map<String, String>? headers,
        bool isFormUrlEncoded = false,
        String? errorFieldKey,
      }) async {
    return _performRequest<T>(
      method: 'PATCH',
      url: url,
      data: isFormUrlEncoded ? _prepareFormData(body) : body,
      queryParameters: queryParameters,
      headers: headers,
      isFormUrlEncoded: isFormUrlEncoded,
        errorFieldKey:errorFieldKey
    );
  }

  Future<RemoteResponse<T>> delete<T>(
      String url, {
        Map<String, dynamic>? queryParameters,
        Map<String, String>? headers,
        String? errorFieldKey,
      }) async {
    return _performRequest<T>(
      method: 'DELETE',
      url: url,
      queryParameters: queryParameters,
      headers: headers,
        errorFieldKey:errorFieldKey
    );
  }

  /// Prepares form data for file uploads and form-encoded requests.
  FormData _prepareFormData(dynamic body) {
    if (body is! Map<String, dynamic>) {
      throw ArgumentError('Body must be a Map<String, dynamic> for form data');
    }

    final formData = FormData();

    body.forEach((key, value) {
      if (value is File) {
        formData.files.add(MapEntry(
          key,
          MultipartFile.fromFileSync(value.path, filename: value.uri.pathSegments.last),
        ));
      } else if (value is List<File>) {
        for (final file in value) {
          formData.files.add(MapEntry(
            key,
            MultipartFile.fromFileSync(file.path, filename: file.uri.pathSegments.last),
          ));
        }
      } else {
        formData.fields.add(MapEntry(key, value.toString()));
      }
    });

    return formData;
  }

  Future<RemoteResponse<T>> _performRequest<T>({
    required String method,
    required String url,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    bool isFormUrlEncoded = false,
    String? errorFieldKey,
  }) async {
    final logger = LoggerFactory.logger; // Use the singleton logger
    final stopwatch = Stopwatch()..start();

    try {
      logger.debug('Performing $method request to $url');

      final response = await _dio.request(
        url,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          method: method,
          headers: {
            ..._dio.options.headers.map((key, value) => MapEntry(key, value.toString())), // Base headers
            if (headers != null)  ...headers.map((key, value) => MapEntry(key, value.toString())), // Custom headers
          },
          contentType: isFormUrlEncoded
              ? Headers.formUrlEncodedContentType
              : Headers.jsonContentType,
        ),
      );

      stopwatch.stop();
      _trackApiMetrics(
        method: method,
        url: url,
        duration: stopwatch.elapsed,
        success: response.statusCode != null &&
            response.statusCode! >= 200 &&
            response.statusCode! < 300,
      );

      logger.debug('Response for $method $url: ${response.statusCode}');
      final responseData = response.data is String
          ? jsonDecode(response.data)
          : response.data;

      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        if (responseData == null || responseData == '' || (responseData is Map && responseData.isEmpty)) {
          logger.info('No data returned for $url');
          return const RemoteResponse.noData();
        }
        return RemoteResponse.data(responseData as T);
      } else {
        return _handleErrorResponse<T>(response, responseData,errorFieldKey!);
      }
    } on DioException catch (e) {
      stopwatch.stop();
      _trackApiMetrics(
        method: method,
        url: url,
        duration: stopwatch.elapsed,
        success: false,
      );

      logger.error('DioException during $method $url', error: e);
      return _handleDioError<T>(e,errorFieldKey!);
    } catch (e, stackTrace) {
      stopwatch.stop();
      _trackApiMetrics(
        method: method,
        url: url,
        duration: stopwatch.elapsed,
        success: false,
      );

      logger.error('Unexpected error during $method $url', error: e, stackTrace: stackTrace);
      return RemoteResponse.unexpectedError(message: e.toString());
    }
  }

  void _trackApiMetrics({
    required String method,
    required String url,
    required Duration duration,
    required bool success,
  }) {
    final metricsService = MetricsService();
    metricsService.logApiMetrics(
      method: method,
      url: url,
      duration: duration,
      success: success,
    );
  }



  // === ERROR HANDLING === //

  RemoteResponse<T> _handleErrorResponse<T>(Response response, dynamic responseData,String errorFieldKey) {
    final logger = LoggerFactory.logger;
    var errorMessage='';
    if(responseData?[errorFieldKey] is String){
      errorMessage = responseData?[errorFieldKey];
    }else if(responseData?[errorFieldKey] is List<T>){
      errorMessage = responseData?[errorFieldKey][0];
    }else{
      errorMessage = "unknown Error";
    }
    // final errorMessage = responseData?['message'] ?? 'Error ${response.statusCode}';
    logger.error('Error ${response.statusCode}: $errorMessage');
    return RemoteResponse.failure(
      errorMessage,
      false,
      statusCode: response.statusCode,
    );
  }

  RemoteResponse<T> _handleDioError<T>(DioException e,String errorFieldKey) {
    final logger = LoggerFactory.logger;

    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.error is SocketException) {
      logger.error('No internet connection: ${e.message}');
      return const RemoteResponse.noConnection();
    } else if (e.response != null) {
      return _handleErrorResponse(e.response!, e.response?.data,errorFieldKey);
    } else {
      logger.error('Dio error: ${e.message}');
      return RemoteResponse.unexpectedError(message: e.message ?? 'Unexpected error occurred');
    }
  }

  Future<RemoteResponse<T>> uploadFile<T>(
      String url, {
        required File file,
        String fileField = 'file',
        Map<String, String>? headers,
      }) async {
    final formData = FormData.fromMap({
      fileField: await MultipartFile.fromFile(file.path, filename: file.uri.pathSegments.last),
    });

    return _performRequest<T>(
      method: 'POST',
      url: url,
      data: formData,
      headers: headers,
    );
  }

  Future<RemoteResponse<T>> uploadMultipleFiles<T>(
      String url, {
        required List<File> files,
        String fileField = 'files',
        Map<String, String>? headers,
      }) async {
    final formData = FormData();

    for (final file in files) {
      formData.files.add(
        MapEntry(
          fileField,
          await MultipartFile.fromFile(file.path, filename: file.uri.pathSegments.last),
        ),
      );
    }

    return _performRequest<T>(
      method: 'POST',
      url: url,
      data: formData,
      headers: headers,
    );
  }

}
