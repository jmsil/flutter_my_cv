import 'package:flutter/material.dart';

import '../content.dart';
import 'sidebar.dart';

class SidebarScaffold extends StatelessWidget {
  static const double maxWidth = 1280;

  final Function() onPressedPt;
  final Function() onPressedEn;

  SidebarScaffold(this.onPressedPt, this.onPressedEn);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: AppSidebar(null, onPressedPt, onPressedEn)
            ),
            Expanded(
              flex: 2,
              child: AppContent(false)
            )
          ]
        )
      )
    );
  }
}