import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'const.dart';
import 'container.dart';
import 'content.dart';
import 'scroller.dart';
import 'sidebar.dart';
import 'strings.dart';
import 'theme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent)
  );
  runApp(_Scaffold());
}

class _Scaffold extends StatefulWidget {
  @override
  _ScaffoldState createState() => _ScaffoldState();
}

class _ScaffoldState extends State {
  final GlobalKey<DrawerControllerState> drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Widget widgetBuilder = Builder(
      builder: (context) {
        if (MediaQuery.of(context).size.width >= 880) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: AppSidebar(null, onPressedPt, onPressedEn)),
              Expanded(flex: 2, child: AppContent())
            ]
          );
        }

        return Stack(
          children: [
            AppContent(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: FloatingActionButton(
                  backgroundColor: AppTheme.midBlue,
                  child: Icon(AppIcons.account, color: AppTheme.highLightColor),
                  shape: BeveledRectangleBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(double.maxFinite))
                  ),
                  mouseCursor: SystemMouseCursors.basic,
                  onPressed: () => drawerKey.currentState?.open()
                )
              )
            ),
            AppSidebar(drawerKey, onPressedPt, onPressedEn)
          ]
        );
      }
    );

    return MaterialApp(
      title: CvStrings.appName,
      scrollBehavior: AppScrollBehavior(),
      home: Material(
        color: AppTheme.highDarkColor,
        child: SafeArea(
          child: Center(
            child: AppContainer(
              width: 1280,
              color: AppTheme.midLightColor,
              margin: const EdgeInsets.all(16),
              child: widgetBuilder
            )
          )
        )
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