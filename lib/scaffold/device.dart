import 'package:web/web.dart' as Web;

class AppDevice {
  static bool isMobileDevice() {
    String userAgent = Web.window.navigator.userAgent.toLowerCase();
    return
      userAgent.contains('iphone') ||
      userAgent.contains('ipad') ||
      userAgent.contains('android');
  }
}