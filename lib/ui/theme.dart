import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const double _normalFontSize = 13.5;
  static const double _largeFontSize = 15.5;

  static final Color highLightColor = Colors.blueGrey[50]!;
  static final Color midLightColor = Colors.blueGrey[100]!;
  static final Color lowLightColor = Colors.blueGrey[200]!;
  static final Color highDarkColor = Colors.blueGrey[800]!;
  static final Color lowDarkColor = Colors.blueGrey[700]!;
  static final Color lightBlue = Colors.blue[200]!;
  static final Color darkBlue = Colors.blue[900]!;
  static final Color darkColor = Colors.black;


  static final TextStyle normalLightStyle =
    TextStyle(fontSize: _normalFontSize, color: highLightColor);
  static final TextStyle normalLowLightStyle =
    TextStyle(fontSize: _normalFontSize, color: lowLightColor);
  static final TextStyle normalLightBlueStyle =
    TextStyle(fontSize: _normalFontSize, color: lightBlue);
  static final TextStyle normalDarkBlueStyle =
    TextStyle(fontSize: _normalFontSize, color: darkBlue);
  static final TextStyle normalDarkBlueBoldStyle =
    TextStyle(fontSize: _normalFontSize, color: darkBlue, fontWeight: FontWeight.bold);
  static final TextStyle normalDarkBlueItalicStyle =
    TextStyle(fontSize: _normalFontSize, color: darkBlue, fontStyle: FontStyle.italic);
  static final TextStyle normalDarkStyle = TextStyle(fontSize: _normalFontSize, color: darkColor);

  static final TextStyle largeLightStyle =
    TextStyle(fontSize: _largeFontSize, color: highLightColor);
  static final TextStyle largeLightBlueStyle =
    TextStyle(fontSize: _largeFontSize, color: lightBlue);
  static final TextStyle largeDarkBoldStyle =
    TextStyle(fontSize: _largeFontSize, color: darkColor, fontWeight: FontWeight.bold);


  static const BorderRadius defaultRadius = BorderRadius.all(Radius.circular(8));
}