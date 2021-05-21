import 'package:flutter/material.dart';
import 'package:my_cv/button.dart';
import 'package:my_cv/container.dart';
import 'package:my_cv/scroller.dart';
import 'package:my_cv/separator.dart';
import 'package:my_cv/strings.dart';
import 'package:my_cv/text.dart';

class CvSidebarWidget extends StatelessWidget {
  static const EdgeInsets headerPadding = EdgeInsets.fromLTRB(32, 32, 32, 40);

  final GlobalKey<DrawerControllerState>? drawerKey;
  final Function() onPressedPt;
  final Function() onPressedEn;

  CvSidebarWidget(this.drawerKey, this.onPressedPt, this.onPressedEn);

  @override
  Widget build(BuildContext context) {
    final bool isHeaderPinned = MediaQuery.of(context).size.height >= 480;

    final Widget headerWidget = Column(
      children: [
        Flexible(
          child: CvContainer(4, 32, 'photo.jpg', null)
        ),
        CvSep.sep16,
        CvSidebarTitle('João Marques da Silva'),
        CvSep.sep8,
        SizedBox(width: 96, child: CvSep.div),
        CvSep.sep8,
        CvSidebarTitle(CvStrings.role)
      ]
    );

    final List<Widget> infosWidget = [

      // Details
      CvSidebarTitleWithDivider(CvStrings.details),
      CvSep.sep16,
      CvSidebarTextWithIcon(Icons.room_outlined, CvStrings.brazil),
      CvSep.sep12,
      CvSidebarTextWithIcon(Icons.phone_outlined, '+55 62 99497-1154'),
      CvSep.sep12,
      CvSidebarTextWithIcon(Icons.mail_outlined, 'jmsilva.inbox@gmail.com'),
      CvSep.sep12,
      CvSidebarTextWithIcon(Icons.code_outlined, 'https://github.com/Jmsil', true),
      CvSep.sep40,

      // Skills
      CvSidebarTitleWithDivider(CvStrings.skills),
      CvSep.sep16,
      CvSidebarTextWithIcon(Icons.arrow_right, 'Dart/Flutter'),
      CvSep.sep8,
      CvSidebarTextWithIcon(Icons.arrow_right, 'Android SDK'),
      CvSep.sep8,
      CvSidebarTextWithIcon(Icons.arrow_right, 'Java'),
      CvSep.sep8,
      CvSidebarTextWithIcon(Icons.arrow_right, 'C/C++'),
      CvSep.sep8,
      CvSidebarTextWithIcon(Icons.arrow_right, 'Oracle Database'),
      CvSep.sep8,
      CvSidebarTextWithIcon(Icons.arrow_right, 'MySQL Database'),
      CvSep.sep8,
      CvSidebarTextWithIcon(Icons.arrow_right, 'SQL/PL SQL'),
      CvSep.sep8,
      CvSidebarTextWithIcon(Icons.arrow_right, 'Git'),
      CvSep.sep40,

      // About Me & Expectations
      CvSidebarTitleWithDivider(CvStrings.aboutAndExpectationsTitle),
      CvSep.sep16,
      CvNormalText(CvStrings.aboutAndExpectationsText, true)
    ];

    final Widget footerWidget = Container(
      color: Colors.blueGrey[700],
      padding: CvSep.horEdgeInsets8,
      child: Material(
        type: MaterialType.transparency,
        child: Row(
          children: [
            FlutterLogo(size: 32),
            CvSep.sep8,
            Expanded(
              child: CvNormalText(CvStrings.powredByFlutter, true)
            ),
            CvSep.sep8,
            CvButton(
              CvStrings.langIdx == 0 ? CvSidebarTitle('Pt') : CvNormalText('Pt', true), onPressedPt
            ),
            CvButton(
              CvStrings.langIdx == 1 ? CvSidebarTitle('En') : CvNormalText('En', true), onPressedEn
            )
          ]
        )
      )
    );

    final rootWidget = Container(
      width: drawerKey == null ? null : 360,
      color: Colors.blueGrey[800],
      child: Column(
        children: [
          Expanded(
            child: CvSliverScroller(
              Colors.blue[200]!,
              [
                // Header
                SliverAppBar(
                  pinned: isHeaderPinned,
                  stretch: true,
                  expandedHeight: 190 + headerPadding.vertical,
                  collapsedHeight: 85 + headerPadding.vertical,
                  elevation: 0,
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.blueGrey[800],
                  leading: drawerKey == null
                    ? null
                    : CvButton(
                        Icon(Icons.arrow_back, size: 24),
                        () => drawerKey?.currentState?.close()
                      ),
                  flexibleSpace: Padding(
                    padding: headerPadding,
                    child: headerWidget
                  )
                ),

                // Informations
                SliverPadding(
                  padding: CvSep.horEdgeInsets32,
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      infosWidget,
                      addAutomaticKeepAlives: false,
                      addRepaintBoundaries: false,
                      addSemanticIndexes: false
                    )
                  )
                )
              ]
            )
          ),

          // Footer
          CvSep.sep16,
          footerWidget
        ]
      )
    );

    if (drawerKey == null)
      return rootWidget;

    return DrawerController(
      key: drawerKey,
      alignment: DrawerAlignment.start,
      child: rootWidget
    );
  }
}