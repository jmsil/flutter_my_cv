import 'package:flutter/material.dart';

import '../ui/layout/layout_provider.dart';
import 'desktop_scaffold.dart';
import 'mobile_scaffold.dart';

class MainScaffold extends ListenableBuilder {
  MainScaffold()
    : super(
        listenable: LayoutProvider.instance,
        builder: (builderContext, builderChild) {
          final AppTheme theme = builderContext.appLayout.theme;
          final bool isDesktopScreen = builderContext.isDesktopScreen;
          return Material(
            color: theme.backgroundColor,
            child: isDesktopScreen
              ? DesktopScaffold()
              : MobileScaffold()
          );
        }
      );
}

extension BuildContextExtension on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;
  bool get isSmallMobileScreen => screenSize.width < 430;
  bool get isDesktopScreen => screenSize.width >= 1260;
  bool get isLargeDesktopScreen => screenSize.width >= 1640;
}