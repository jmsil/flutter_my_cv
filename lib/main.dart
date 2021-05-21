import 'package:flutter/material.dart';
import 'package:my_cv/content.dart';
import 'package:my_cv/scroller.dart';
import 'package:my_cv/separator.dart';
import 'package:my_cv/sidebar.dart';
import 'package:my_cv/strings.dart';

void main() => runApp(CvApp());

class CvApp extends StatefulWidget {
  @override
  CvAppState createState() => CvAppState();
}

class CvAppState extends State {
  final GlobalKey<DrawerControllerState> drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: CvStrings.appName,
      scrollBehavior: CvScrollBehavior(),
      home: SafeArea(
        child: Material(
          color: Colors.blueGrey[900],
          child: Center(
            child: Container(
              width: 1024,
              margin: CvSep.allEdgeInsets24,
              decoration: BoxDecoration(
                color: Colors.blueGrey[100],
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(0, 4),
                    blurRadius: 12
                  )
                ]
              ),

              child: Builder(
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
              )
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