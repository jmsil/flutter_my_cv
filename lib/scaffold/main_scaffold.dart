import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../scroller.dart';
import '../strings.dart';
import '../theme.dart';
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
      title: CvStrings.appName,
      scrollBehavior: AppScrollBehavior(),
      home: Builder(
        builder: (context) {
          final Size screenSize = MediaQuery.of(context).size;
          final bool isFloating = math.min(screenSize.width, screenSize.height) > 480;

          Widget rWidget = screenSize.width > 1024
            ? SidebarScaffold(onPressedPt, onPressedEn)
            : AppbarScaffold(
                drawerKey,
                screenSize.width <= screenSize.height,
                onPressedPt, onPressedEn
              );

          if (isFloating) {
            rWidget = SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: rWidget
              )
            );
          }

          if (isFloating || screenSize.width > SidebarScaffold.maxWidth) {
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
    if (CvStrings.setLanguage(0))
      setState(() {});
  }

  void onPressedEn() {
    if (CvStrings.setLanguage(1))
      setState(() {});
  }
}