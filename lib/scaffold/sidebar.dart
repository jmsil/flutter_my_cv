import 'package:flutter/material.dart';

import '../ui/button.dart';
import '../ui/const.dart';
import '../ui/container.dart';
import '../ui/divider.dart';
import '../ui/scroller.dart';
import '../ui/strings.dart';
import '../ui/text.dart';
import '../ui/theme.dart';

class AppSidebar extends StatelessWidget {
  static const EdgeInsets _headerPadding = EdgeInsets.fromLTRB(32, 32, 32, 40);

  final GlobalKey<DrawerControllerState>? drawerKey;
  final Function() onPressedPt;
  final Function() onPressedEn;

  AppSidebar(this.drawerKey, this.onPressedPt, this.onPressedEn);

  @override
  Widget build(BuildContext context) {
    final double headerExpandedHeight = 216;
    final bool isHeaderPinned = MediaQuery.of(context).size.height > 480;

    final Widget headerWidget = Column(
      children: [
        Flexible(
          child: AspectRatio(
            aspectRatio: 1,
            child: AppContainer(
              borderSize: 4,
              borderColor: AppTheme.highLightColor,
              borderRadius: BorderRadius.circular(headerExpandedHeight / 6),
              isClipped: true,
              child: Image.asset('assets/photo.jpg', fit: BoxFit.cover)
            )
          )
        ),
        AppUiConst.vsep16,
        Text('João Marques da Silva', style: AppTheme.largeLightBlueStyle),
        AppUiConst.vsep8,
        SizedBox(width: 96, child: AppDivider(4)),
        AppUiConst.vsep8,
        Text(CvStrings.role, style: AppTheme.largeLightBlueStyle)
      ]
    );

    final List<Widget> infosWidget = [
      // Details
      AppSidebarTitleDivider(CvStrings.details),
      AppUiConst.vsep16,
      AppIconText(AppIcons.local, CvStrings.brazil, true),
      AppUiConst.vsep12,
      AppIconText(AppIcons.phone, '+55 62 99497-1154', true),
      AppUiConst.vsep12,
      AppIconText(AppIcons.mail, 'jmsilva.inbox@gmail.com', true),
      AppUiConst.vsep12,
      AppIconText(AppIcons.code, 'https://github.com/Jmsil', true, true),
      AppUiConst.vsep40,

      // Skills
      AppSidebarTitleDivider(CvStrings.skills),
      AppUiConst.vsep16,
      AppIconText(AppIcons.arrow, 'Dart/Flutter', true),
      AppUiConst.vsep8,
      AppIconText(AppIcons.arrow, 'Android SDK', true),
      AppUiConst.vsep8,
      AppIconText(AppIcons.arrow, 'Java', true),
      AppUiConst.vsep8,
      AppIconText(AppIcons.arrow, 'C/C++', true),
      AppUiConst.vsep8,
      AppIconText(AppIcons.arrow, 'Oracle Database', true),
      AppUiConst.vsep8,
      AppIconText(AppIcons.arrow, 'MySQL Database', true),
      AppUiConst.vsep8,
      AppIconText(AppIcons.arrow, 'SQL/PL SQL', true),
      AppUiConst.vsep8,
      AppIconText(AppIcons.arrow, 'Git', true),
      AppUiConst.vsep40,

      // About Me & Expectations
      AppSidebarTitleDivider(CvStrings.aboutAndExpectationsTitle),
      AppUiConst.vsep16,
      Text(CvStrings.aboutAndExpectationsText, style: AppTheme.normalLightStyle)
    ];

    final Widget footerWidget = AppContainer(
      color: AppTheme.lowDarkColor,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        children: [
          FlutterLogo(size: 32),
          AppUiConst.hsep8,
          Expanded(
            child: Text(CvStrings.powredByFlutter, style: AppTheme.normalLightStyle)
          ),
          AppUiConst.hsep8,
          AppButton.label(CvStrings.langIdx == 0, 'Pt', onPressedPt),
          AppButton.label(CvStrings.langIdx == 1, 'En', onPressedEn)
        ]
      )
    );

    final containerWidget = AppContainer(
      width: drawerKey == null ? null : 420,
      color: AppTheme.midDarkColor,
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: AppSliverScroller(
                AppTheme.lightBlue,
                [
                  // Header
                  SliverAppBar(
                    pinned: isHeaderPinned,
                    stretch: true,
                    expandedHeight: headerExpandedHeight + _headerPadding.vertical,
                    collapsedHeight: 85 + _headerPadding.vertical,
                    elevation: 0,
                    automaticallyImplyLeading: false,
                    backgroundColor: AppTheme.midDarkColor,
                    leading: drawerKey == null
                      ? null
                      : AppButton.icon(
                          AppIcons.back,
                          () => drawerKey?.currentState?.close()
                        ),
                    flexibleSpace: Padding(
                      padding: _headerPadding,
                      child: headerWidget
                    )
                  ),

                  // Informations
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate(infosWidget)
                    )
                  )
                ]
              )
            ),

            AppUiConst.vsep16,
            footerWidget
          ]
        )
      )
    );

    return drawerKey == null
      ? containerWidget
      : DrawerController(
          key: drawerKey,
          alignment: DrawerAlignment.start,
          child: containerWidget
        );
  }
}