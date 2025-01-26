import 'package:core/exceptions/base_exception.dart';
import 'package:core/services/logger_service.dart';
import 'package:data/sources/remote/clients/interceptors/error_handlers.dart';
import 'package:data/sources/remote/clients/models/NetworkResponse.dart';
import 'package:data/sources/remote/clients/network_client.dart';

abstract class BaseRemoteDataSource {
  BaseRemoteDataSource(this.client);

  final NetworkClient client;

  Future<NetworkResponse<T>> callApiWithErrorParser<T>(
      Future<NetworkResponse<T>> api) async {
    try {
      NetworkResponse<T> response = await api;

      return response;
    } catch (error) {
      AppLogger.e("Generic error: >>>>>>> $error");

      if (error is BaseException) {
        rethrow;
      }

      throw handleError("$error");
    }
  }
}
