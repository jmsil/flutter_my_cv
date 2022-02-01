import 'package:flutter/material.dart';

import '../button.dart';
import '../const.dart';
import '../container.dart';
import '../content.dart';
import '../sidebar.dart';
import '../strings.dart';
import '../theme.dart';

class AppbarScaffold extends StatelessWidget {
  final GlobalKey<DrawerControllerState> drawerKey;
  final bool isPortrait;
  final Function() onPressedPt;
  final Function() onPressedEn;

  AppbarScaffold(
    this.drawerKey, this.isPortrait, this.onPressedPt, this.onPressedEn
  );

  @override
  Widget build(BuildContext context) {
    final Widget drawerButton = AppButton.icon(
      AppIcons.account,
      () => drawerKey.currentState?.open()
    );

    final Widget infosWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('João Marques da Silva', style: AppTheme.largeLightStyle),
        AppUiConst.vsep4,
        Text(CvStrings.role, style: AppTheme.normalLowLightStyle)
      ]
    );

    if (isPortrait) {
      return Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Material(
                color: AppTheme.midDarkColor,
                child: SafeArea(
                  bottom: false,
                  child: const SizedBox(height: 144)
                )
              ),
              Expanded(
                child: Material(
                  color: AppTheme.midLightColor
                )
              )
            ]
          ),
          SafeArea(
            child: Column(
              children: [
                Material(
                  type: MaterialType.transparency,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Row(
                      children: [
                        drawerButton,
                        AppUiConst.hsep8,
                        Expanded(
                          child: infosWidget
                        )
                      ]
                    )
                  )
                ),
                Expanded(
                  child: AppContent(true)
                )
              ]
            )
          ),
          AppSidebar(drawerKey, onPressedPt, onPressedEn)
        ]
      );
    }

    return Stack(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppContainer(
              color: AppTheme.midDarkColor,
              padding: const EdgeInsets.all(8),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: RotatedBox(
                        quarterTurns: -45,
                        child: infosWidget
                      )
                    ),
                    AppUiConst.vsep8,
                    drawerButton
                  ]
                )
              )
            ),
            Expanded(
              child: AppContent(false)
            )
          ]
        ),
        AppSidebar(drawerKey, onPressedPt, onPressedEn)
      ]
    );
  }
}