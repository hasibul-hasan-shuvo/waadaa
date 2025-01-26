import 'dart:io';

import 'package:core/exceptions/api_exception.dart';
import 'package:core/exceptions/app_exception.dart';
import 'package:core/exceptions/network_exception.dart';
import 'package:core/exceptions/not_found_exception.dart';
import 'package:core/exceptions/service_unavailable_exception.dart';
import 'package:core/exceptions/timeout_exception.dart';
import 'package:core/exceptions/unauthorized_exception.dart';
import 'package:core/services/logger_service.dart';
import 'package:dio/dio.dart';

Exception handleError(String error) {
  AppLogger.e("Generic exception: $error");

  return AppException(message: error);
}

Exception handleDioError(DioException dioError) {
  switch (dioError.type) {
    case DioExceptionType.cancel:
      return AppException(message: "Request to API server was cancelled");
    case DioExceptionType.connectionTimeout:
      return AppException(message: "Connection timeout with API server");
    case DioExceptionType.connectionError:
      return NetworkException(message: "There is no internet connection");
    case DioExceptionType.receiveTimeout:
      return TimeoutException(
          message: "Receive timeout in connection with API server");
    case DioExceptionType.sendTimeout:
      return TimeoutException(
          message: "Send timeout in connection with API server");
    case DioExceptionType.badResponse:
      return _parseDioErrorResponse(dioError);
    case DioExceptionType.badCertificate:
      return AppException(message: 'Bad certificate');
    case DioExceptionType.unknown:
      return NetworkException(message: "There is no internet connection");
  }
}

Exception _parseDioErrorResponse(DioException dioError) {
  int statusCode = dioError.response?.statusCode ?? -1;
  String? status;
  String? serverMessage;

  try {
    if (statusCode == -1 || statusCode == HttpStatus.ok) {
      statusCode = dioError.response?.data["statusCode"];
    }
    status = "${dioError.response?.data["status"]}";
    serverMessage = dioError.response?.data["message"];
  } catch (error, stackTrace) {
    AppLogger.e(error.toString(), stackTrace);

    serverMessage = "Something went wrong. Please try again later.";
  }

  switch (statusCode) {
    case HttpStatus.serviceUnavailable:
      return ServiceUnavailableException("Service Temporarily Unavailable");
    case HttpStatus.notFound:
      return NotFoundException(serverMessage ?? "", status ?? "");
    case HttpStatus.unauthorized:
      return UnauthorizedException(serverMessage ?? "");
    default:
      return ApiException(
        httpCode: statusCode,
        status: status ?? "",
        message: serverMessage ?? "",
      );
  }
}
