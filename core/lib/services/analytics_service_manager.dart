import 'package:core/services/logger_service.dart';

/// Currently this class is just a placeholder for the actual implementation.
/// In the future we can add more analytics services like Firebase, Sentry etc.
class AnalyticsServiceManager {
  AnalyticsServiceManager._();

  static Future<dynamic> logException({
    required String tag,
    required Exception exception,
    StackTrace? stackTrace,
    dynamic extra,
  }) {
    AppLogger.e(
      "$tag: $exception",
      stackTrace,
    );

    return Future(() => null);
  }

  static Future<dynamic> logEvent({
    required String tag,
    StackTrace? stackTrace,
    dynamic extra,
  }) {
    AppLogger.i(
      "$tag: $extra \nStackTrace:$stackTrace",
    );

    return Future(() => null);
  }

  static Future<dynamic> addBreadcrumb({
    required String tag,
    required String message,
    String? category,
    Map<String, dynamic>? data,
  }) {
    AppLogger.i(
      "$tag: $message \n Category: $category \nData:$data",
    );

    return Future(() => null);
  }
}
