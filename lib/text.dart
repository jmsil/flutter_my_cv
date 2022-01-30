import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as urll;

import 'const.dart';
import 'divider.dart';
import 'theme.dart';

const double textSize = 13.5;

class CvNormalText extends Text {
  CvNormalText(String text, bool isSidebar, [bool isLink = false])
    :
    super(
      text,
      textScaleFactor: 1,
      style: TextStyle(
        fontSize: textSize,
        color: isSidebar
          ? isLink ? AppTheme.lightBlue : AppTheme.highLightColor
          : isLink ? AppTheme.darkBlue : AppTheme.darkColor,
        decorationThickness: isLink ? 2 : null,
        decoration: isLink ? TextDecoration.underline : null
      )
    );
}



class AppIconText extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isSidebar;
  final bool isLink;

  AppIconText(this.icon, this.text, this.isSidebar, [this.isLink = false]);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: AppTheme.smallIconSize,
          color: isSidebar ? AppTheme.highLightColor : AppTheme.darkColor
        ),
        AppUiConst.hsep8,
        Expanded(
          child: isLink
            ? AppLink(text, isSidebar)
            : Text(
                text,
                style: isSidebar ? AppTheme.normalLightStyle : AppTheme.normalDarkStyle
              )
        )
      ]
    );
  }
}

class AppSidebarTitleDivider extends StatelessWidget {
  final String text;

  AppSidebarTitleDivider(this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(text, style: AppTheme.largeLightBlueStyle),
        AppUiConst.hsep8,
        Expanded(
          child: AppDivider()
        )
      ]
    );
  }
}



class AppLink extends StatefulWidget {
  final String text;
  final bool isSidebar;

  AppLink(this.text, this.isSidebar);

  @override
  _AppLinkState createState() => _AppLinkState();
}

class _AppLinkState extends State<AppLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: _launch,
      onHover: (value) => setState(() => _hovered = value),
      child: Text(
        widget.text,
        style: widget.isSidebar
          ? _hovered ? AppTheme.normalLightBlueStyle : AppTheme.normalLightStyle
          : _hovered ? AppTheme.normalDarkBlueStyle : AppTheme.normalDarkStyle
      )
    );
  }

  void _launch() async {
    if (await urll.canLaunch(widget.text))
      urll.launch(widget.text);
  }
}