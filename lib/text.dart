import 'package:flutter/material.dart';
import 'package:my_cv/separator.dart';
import 'package:url_launcher/url_launcher.dart' as urll;

const double iconSize = 20;
const double titleSize = 15.5;
const double textSize = 13.5;
final Color sidebarTitleColor = Colors.blue[200]!;
final Color sidebarTextColor = Colors.blueGrey[100]!;
final Color contentTitleColor = Colors.blue[900]!;
final Color contentTextColor = Colors.black;

class CvNormalText extends Text {
  CvNormalText(String text, bool isSidebar, [bool isLink = false])
    :
    super(
      text,
      textScaleFactor: 1,
      style: TextStyle(
        fontSize: textSize,
        color: isSidebar
          ? isLink ? sidebarTitleColor : sidebarTextColor
          : isLink ? contentTitleColor : contentTextColor,
        decorationThickness: isLink ? 2 : null,
        decoration: isLink ? TextDecoration.underline : null
      )
    );
}

class CvLink extends StatefulWidget {
  final String text;
  final bool isSidebar;

  CvLink(this.text, this.isSidebar);

  @override
  _CvLinkState createState() => _CvLinkState();
}

class _CvLinkState extends State<CvLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: _launch,
      onHover: (value) => setState(() => _hovered = value),
      child: widget.isSidebar
        ? CvNormalText(widget.text, true, _hovered)
        : CvNormalText(widget.text, false, _hovered)
    );
  }

  void _launch() async {
    if (await urll.canLaunch(widget.text))
      urll.launch(widget.text);
  }
}



class CvSidebarTitle extends Text {
  CvSidebarTitle(String text)
    :
    super(
      text,
      textScaleFactor: 1,
      style: TextStyle(fontSize: titleSize, color: sidebarTitleColor)
    );
}

class CvSidebarTitleWithDivider extends StatelessWidget {
  final String text;

  CvSidebarTitleWithDivider(this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CvSidebarTitle(text),
        CvSep.sep8,
        Expanded(child: CvSep.div)
      ]
    );
  }
}

class CvSidebarTextWithIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isLink;

  CvSidebarTextWithIcon(this.icon, this.text, [this.isLink = false]);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: iconSize, color: sidebarTextColor),
        CvSep.sep8,
        Flexible(child: isLink ? CvLink(text, true) : CvNormalText(text, true))
      ]
    );
  }
}



class CvContentTitleWithBkg extends StatelessWidget {
  final String text;

  CvContentTitleWithBkg(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[200],
      padding: EdgeInsets.fromLTRB(32, 2, 32, 2),
      child: Text(
        text,
        textScaleFactor: 1,
        style: TextStyle(
          fontSize: titleSize,
          color: contentTitleColor,
          fontWeight: FontWeight.bold
        )
      )
    );
  }
}

class CvContentTitle extends Text {
  CvContentTitle(String text, bool isPeriod)
    :
    super(
      text,
      textScaleFactor: 1,
      style: TextStyle(
        fontSize: isPeriod ? textSize : titleSize,
        color: contentTitleColor,
        fontStyle: isPeriod ? FontStyle. italic : FontStyle.normal
      )
    );
}

class CvContentTextWithIcon extends StatelessWidget {
  final String text;

  CvContentTextWithIcon(this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.arrow_right, size: iconSize, color: contentTextColor),
        CvSep.sep8,
        Flexible(child: CvNormalText(text, false))
      ]
    );
  }
}