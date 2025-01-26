import 'package:core/localizations/message_resolver.dart';

class StaticMessageResolver extends MessageResolver {
  final String _message;

  StaticMessageResolver(this._message);

  String get message => _message;
}
