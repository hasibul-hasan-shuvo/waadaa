import 'package:core/localizations/message_resolver.dart';
import 'package:flutter/cupertino.dart';

abstract class LocalizedMessageResolver extends MessageResolver {
  final String placeHolderMessage;

  LocalizedMessageResolver({required this.placeHolderMessage});

  String getLocalizedMessage(BuildContext context);
}
