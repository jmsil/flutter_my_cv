import 'package:flutter/material.dart';

import '../ui/scroller.dart';
import '../ui/strings.dart';
import '../ui/theme.dart';
import 'appbar_scaffold.dart';
import 'sidebar_scaffold.dart';

class MainScaffold extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State {
  final GlobalKey<DrawerControllerState> drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      scrollBehavior: AppScrollBehavior(),
      home: Builder(
        builder: (context) {
          final Size screenSize = MediaQuery.of(context).size;

          Widget rWidget = screenSize.width > 1024
            ? SidebarScaffold(onPressedPt, onPressedEn)
            : AppbarScaffold(
                drawerKey,
                screenSize.width <= screenSize.height,
                onPressedPt, onPressedEn
              );

          if (screenSize.width > SidebarScaffold.maxWidth) {
            rWidget = Material(
              color: AppTheme.highDarkColor,
              child: rWidget
            );
          }

          return rWidget;
        }
      ),
      builder: (context, homeChild) {
        final MediaQueryData data = MediaQuery.of(context);
        return MediaQuery(
          data: data.copyWith(textScaleFactor: 1),
          child: homeChild!
        );
      },
      debugShowCheckedModeBanner: false
    );
  }

  void onPressedPt() {
    if (AppStrings.setLanguage(0))
      setState(() {});
  }

  void onPressedEn() {
    if (AppStrings.setLanguage(1))
      setState(() {});
  }
}