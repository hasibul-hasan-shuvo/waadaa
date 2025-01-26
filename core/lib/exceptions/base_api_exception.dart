import 'package:core/exceptions/base_exception.dart';

abstract class BaseApiException extends BaseException {
  final int httpCode;
  final String status;

  BaseApiException({this.httpCode = -1, this.status = "", super.message});
}
