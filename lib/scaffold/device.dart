import 'package:flutter/widgets.dart';
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

extension BuildContextExtension on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;
  bool get isExtendedScreen => screenSize.width >= 1260;
}