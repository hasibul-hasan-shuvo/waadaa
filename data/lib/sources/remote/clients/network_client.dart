import 'package:data/sources/remote/clients/models/NetworkResponse.dart';

abstract class NetworkClient {
  Future<NetworkResponse> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  });

  Future<NetworkResponse> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });

  Future<NetworkResponse> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });

  Future<NetworkResponse> patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });

  Future<NetworkResponse> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });

  Future<NetworkResponse> download({
    required String urlPath,
    required dynamic savePath,
    Map<String, dynamic>? queryParameters,
    dynamic data,
  });

  Future<NetworkResponse> downloadUri({
    required Uri uri,
    required dynamic savePath,
    dynamic data,
  });
}
