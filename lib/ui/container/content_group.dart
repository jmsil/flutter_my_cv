import 'package:flutter/material.dart';

import '../const.dart';
import '../theme.dart';
import 'container.dart';

class ContentGroup extends StatelessWidget {
  static const double _headerHeight = 40;

  final IconData icon;
  final String title;
  final List<Widget> children;

  ContentGroup(this.icon, this.title, this.children);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppContainer(
          color: AppTheme.highLightColor,
          margin: const EdgeInsets.only(top: _headerHeight / 2, bottom: 32),
          padding: const EdgeInsets.fromLTRB(12, _headerHeight / 2 + 16, 12, 16),
          borderRadius: AppTheme.defaultRadius,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: children
          )
        ),
        AppContainer(
          height: _headerHeight,
          color: AppTheme.lowLightColor,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          borderColor: AppTheme.darkBlue.withOpacity(0.36),
          borderRadius: AppTheme.defaultRadius,
          hasShadow: true,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: AppTheme.darkColor),
              AppUiConst.hsep8,
              Flexible(
                child: Text(title, style: AppTheme.largeDarkBoldStyle)
              )
            ]
          )
        )
      ]
    );
  }
}