import 'package:data/sources/remote/clients/interceptors/error_handlers.dart';
import 'package:data/sources/remote/clients/interceptors/pretty_dio_logger.dart';
import 'package:data/sources/remote/clients/interceptors/request_headers.dart';
import 'package:data/sources/remote/clients/models/NetworkResponse.dart';
import 'package:data/sources/remote/clients/network_client.dart';
import 'package:di/di.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

@LazySingleton(as: NetworkClient)
class DioClient implements NetworkClient {
  static final String _baseUrl =
      'https://google.com'; // TODO: Add base url here
  final Dio _dio;
  final _prettyDioLogger = PrettyDioLogger(
    requestHeader: kDebugMode,
    requestBody: kDebugMode,
    responseBody: kDebugMode,
    responseHeader: kDebugMode,
    error: true,
    compact: true,
    maxWidth: 90,
  );

  static final BaseOptions _options = BaseOptions(
    baseUrl: _baseUrl,
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
  );

  DioClient() : _dio = Dio(_options) {
    _dio.interceptors.add(_prettyDioLogger);
    _dio.interceptors.add(RequestHeaderInterceptor());
  }

  @override
  Future<NetworkResponse> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return NetworkResponse(
        statusCode: response.statusCode ?? 0,
        data: response.data,
        message: response.statusMessage,
      );
    } on DioException catch (e) {
      throw handleDioError(e);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<NetworkResponse> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return NetworkResponse(
        statusCode: response.statusCode ?? 0,
        data: response.data,
        message: response.statusMessage,
      );
    } on DioException catch (e) {
      throw handleDioError(e);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<NetworkResponse> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return NetworkResponse(
        statusCode: response.statusCode ?? 0,
        data: response.data,
        message: response.statusMessage,
      );
    } on DioException catch (e) {
      throw handleDioError(e);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<NetworkResponse> patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return NetworkResponse(
        statusCode: response.statusCode ?? 0,
        data: response.data,
        message: response.statusMessage,
      );
    } on DioException catch (e) {
      throw handleDioError(e);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<NetworkResponse> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return NetworkResponse(
        statusCode: response.statusCode ?? 0,
        data: response.data,
        message: response.statusMessage,
      );
    } on DioException catch (e) {
      throw handleDioError(e);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<NetworkResponse> download({
    required String urlPath,
    required dynamic savePath,
    Map<String, dynamic>? queryParameters,
    dynamic data,
  }) async {
    try {
      final response = await _dio.download(
        urlPath,
        savePath,
        queryParameters: queryParameters,
        data: data,
      );
      return NetworkResponse(
        statusCode: response.statusCode ?? 0,
        data: response.statusMessage,
        message: response.statusMessage,
      );
    } on DioException catch (e) {
      throw handleDioError(e);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<NetworkResponse> downloadUri({
    required Uri uri,
    required dynamic savePath,
    dynamic data,
  }) async {
    try {
      final response = await _dio.downloadUri(
        uri,
        savePath,
        data: data,
      );
      return NetworkResponse(
        statusCode: response.statusCode ?? 0,
        data: response.statusMessage,
        message: response.statusMessage,
      );
    } on DioException catch (e) {
      throw handleDioError(e);
    } catch (e) {
      rethrow;
    }
  }
}
