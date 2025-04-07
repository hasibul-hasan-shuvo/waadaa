import 'package:url_launcher/url_launcher_string.dart';

class UrlLauncherService {
  UrlLauncherService._();
  static Future<bool> launchUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      return await launchUrlString(url);
    }

    return false;
  }
}
