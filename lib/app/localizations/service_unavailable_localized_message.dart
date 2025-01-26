import 'package:core/localizations/localized_message_resolver.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/extensions/context_extension.dart';

class ServiceUnavailableLocalizedMessage extends LocalizedMessageResolver {
  ServiceUnavailableLocalizedMessage({required super.placeHolderMessage});

  @override
  String getLocalizedMessage(BuildContext context) {
    return context.localizations.messageServiceUnavailableException;
  }
}
