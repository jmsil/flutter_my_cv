import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'container.dart';
import 'content.dart';
import 'scroller.dart';
import 'separator.dart';
import 'sidebar.dart';
import 'strings.dart';

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
              Expanded(child: CvSidebarWidget(null, onPressedPt, onPressedEn)),
              Expanded(flex: 2, child: CvContentWidget())
            ]
          );
        }

        return Stack(
          children: [
            CvContentWidget(),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: CvSep.allEdgeInsets8,
                child: FloatingActionButton(
                  child: Icon(
                    Icons.account_circle_outlined,
                    color: Colors.blueGrey[100]
                  ),
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(double.maxFinite))
                  ),
                  onPressed: () => drawerKey.currentState?.open()
                )
              )
            ),
            CvSidebarWidget(drawerKey, onPressedPt, onPressedEn)
          ]
        );
      }
    );

    return MaterialApp(
      title: CvStrings.appName,
      scrollBehavior: CvScrollBehavior(),
      home: Material(
        color: Colors.blueGrey[900],
        child: SafeArea(
          child: Center(
            child: AppContainer(
              width: 1280,
              color: Colors.blueGrey[100],
              margin: CvSep.allEdgeInsets16,
              child: widgetBuilder
            )
          )
        )
      ),
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