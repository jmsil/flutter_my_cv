import 'package:flutter/material.dart';

import '../ui/button.dart';
import '../ui/const.dart';
import '../ui/container/container.dart';
import '../ui/divider.dart';
import '../ui/scroller.dart';
import '../ui/strings.dart';
import '../ui/text.dart';
import '../ui/theme.dart';

class AppSidebar extends StatelessWidget {
  static const double _headerExpandedHeight = 220;
  static const EdgeInsets _headerPadding = EdgeInsets.fromLTRB(32, 32, 32, 40);

  final GlobalKey<DrawerControllerState>? drawerKey;
  final Function() onPressedPt;
  final Function() onPressedEn;

  AppSidebar(this.drawerKey, this.onPressedPt, this.onPressedEn);

  @override
  Widget build(BuildContext context) {
    final Widget headerWidget = Column(
      children: [
        Flexible(
          child: AspectRatio(
            aspectRatio: 1,
            child: AppContainer(
              borderSize: 2,
              borderColor: AppTheme.highLightColor,
              borderRadius: BorderRadius.circular(1000),
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
        Text(AppStrings.role, style: AppTheme.largeLightBlueStyle)
      ]
    );

    final List<Widget> infosWidget = [
      // Details
      AppSidebarTitleDivider(AppStrings.details),
      AppUiConst.vsep16,
      AppIconText(AppIcons.local, AppStrings.brazil, true),
      AppUiConst.vsep12,
      AppIconText(AppIcons.phone, '+55 62 99497-1154', true),
      AppUiConst.vsep12,
      AppIconText(AppIcons.mail, 'jmsilva.inbox@gmail.com', true),
      AppUiConst.vsep12,
      AppIconText(AppIcons.code, 'https://github.com/Jmsil', true, true),
      AppUiConst.vsep40,

      // Skills
      AppSidebarTitleDivider(AppStrings.skills),
      AppUiConst.vsep16,
      AppIconText(AppIcons.arrow_right, 'Dart/Flutter', true),
      AppUiConst.vsep8,
      AppIconText(AppIcons.arrow_right, 'Android SDK', true),
      AppUiConst.vsep8,
      AppIconText(AppIcons.arrow_right, 'Java', true),
      AppUiConst.vsep8,
      AppIconText(AppIcons.arrow_right, 'C/C++', true),
      AppUiConst.vsep8,
      AppIconText(AppIcons.arrow_right, 'Oracle Database', true),
      AppUiConst.vsep8,
      AppIconText(AppIcons.arrow_right, 'MySQL Database', true),
      AppUiConst.vsep8,
      AppIconText(AppIcons.arrow_right, 'SQL/PL SQL', true),
      AppUiConst.vsep8,
      AppIconText(AppIcons.arrow_right, 'Git', true),
      AppUiConst.vsep40,

      // About Me & Expectations
      AppSidebarTitleDivider(AppStrings.aboutAndExpectationsTitle),
      AppUiConst.vsep16,
      Text(AppStrings.aboutAndExpectationsText, style: AppTheme.normalLightStyle)
    ];

    final Widget footerWidget = AppContainer(
      color: AppTheme.lowDarkColor,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        children: [
          FlutterLogo(size: 32),
          AppUiConst.hsep8,
          Expanded(
            child: Text(AppStrings.powredByFlutter, style: AppTheme.normalLightStyle)
          ),
          AppUiConst.hsep8,
          AppButton.label(AppStrings.langIdx == 0, 'Pt', onPressedPt),
          AppButton.label(AppStrings.langIdx == 1, 'En', onPressedEn)
        ]
      )
    );

    final containerWidget = AppContainer(
      width: 420,
      color: AppTheme.midDarkColor,
      child: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset('assets/background.png', fit: BoxFit.cover),
            Column(
              children: [
                Expanded(
                  child: AppSliverScroller(
                    AppTheme.lightBlue,
                    [
                      // Header
                      SliverAppBar(
                        stretch: true,
                        elevation: 0,
                        automaticallyImplyLeading: false,
                        backgroundColor: Colors.transparent,
                        expandedHeight: _headerExpandedHeight + _headerPadding.vertical,
                        collapsedHeight: 85 + _headerPadding.vertical,
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