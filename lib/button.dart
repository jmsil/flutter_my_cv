import 'package:flutter/material.dart';
import 'package:my_cv/container.dart';

class CvButton extends IconButton {
  CvButton(Widget child, Function() onPressed)
    :
    super(
      iconSize: 36,
      hoverColor: Colors.blueGrey[600],
      icon: CvContainer(2, double.infinity, null, Center(child: child)),
      onPressed: onPressed
    );
}