import 'package:flutter/material.dart';

import 'container.dart';
import 'theme.dart';

class AppButton extends StatelessWidget {
  static const double _containerSize = 36;

  final bool isActive;
  final Widget child;
  final Function() onPressed;

  AppButton.label(this.isActive, String label, this.onPressed)
    :
    child = Text(
      label,
      style: isActive ? AppTheme.normalLightStyle : AppTheme.normalLowLightStyle
    );

  AppButton.icon(IconData icon, this.onPressed)
    :
    isActive = true,
    child = Icon(icon, size: 24, color: AppTheme.highLightColor);

  @override
  Widget build(BuildContext context) {
    final effectsColor = AppTheme.lowLightColor.withOpacity(0.32);
    return IconButton(
      iconSize: _containerSize,
      splashColor: effectsColor,
      hoverColor: effectsColor,
      highlightColor: effectsColor,
      icon: AppContainer(
        borderSize: 2,
        borderColor: isActive ? AppTheme.highLightColor : AppTheme.lowLightColor,
        borderRadius: BorderRadius.circular(_containerSize),
        child: Center(
          child: child
        )
      ),
      mouseCursor: SystemMouseCursors.basic,
      onPressed: onPressed
    );
  }
}