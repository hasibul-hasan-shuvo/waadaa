import 'package:core/localizations/message_resolver.dart';

abstract class BaseStatus {
  final MessageResolver messageResolver;

  BaseStatus({required this.messageResolver});
}

class SuccessMessageStatus extends BaseStatus {
  SuccessMessageStatus({required super.messageResolver});
}

class ErrorMessageStatus extends BaseStatus {
  ErrorMessageStatus({required super.messageResolver});
}

class WarningMessageStatus extends BaseStatus {
  WarningMessageStatus({required super.messageResolver});
}
