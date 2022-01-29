import 'package:flutter/material.dart';

import 'container.dart';

class AppButton extends IconButton {
  static const double _iconSize = 36;

  AppButton(Widget child, Function() onPressed)
    :
    super(
      iconSize: _iconSize,
      hoverColor: Colors.blueGrey[600],
      icon: AppContainer(
        borderSize: 2,
        borderColor: Colors.blueGrey[100],
        borderRadius: BorderRadius.circular(_iconSize),
        child: Center(child: child)
      ),
      onPressed: onPressed
    );
}