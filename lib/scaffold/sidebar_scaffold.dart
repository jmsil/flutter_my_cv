import 'package:flutter/material.dart';

import '../content/content.dart';
import 'sidebar.dart';

class SidebarScaffold extends StatelessWidget {
  final bool isDoubleContent;
  final Function() onPressedPt;
  final Function() onPressedEn;

  SidebarScaffold(this.isDoubleContent, this.onPressedPt, this.onPressedEn);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: AppSidebar(null, onPressedPt, onPressedEn)
        ),
        Expanded(
          flex: isDoubleContent ? 3 : 2,
          child: AppContent(isDoubleContent, false)
        )
      ]
    );
  }
}