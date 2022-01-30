import 'package:flutter/material.dart';

import 'container.dart';
import 'theme.dart';

class AppButton extends IconButton {
  AppButton(Widget child, Function() onPressed)
    :
    super(
      iconSize: AppTheme.largeIconSize,
      hoverColor: Colors.blueGrey[600],
      icon: AppContainer(
        borderSize: 2,
        borderColor: Colors.blueGrey[100],
        borderRadius: BorderRadius.circular(AppTheme.largeIconSize),
        child: Center(child: child)
      ),
      onPressed: onPressed
    );
}