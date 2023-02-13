import 'package:flutter/material.dart';

import '../../ui/const.dart';
import '../../ui/scroller.dart';
import '../../ui/strings.dart';
import '../../ui/theme.dart';
import 'courses_books.dart';
import 'education.dart';
import 'items.dart';
import 'professional_experience.dart';
import 'professional_summary.dart';

class AppContent extends StatelessWidget {
  final bool isDoubleContent;
  final bool isOverlayStyle;

  AppContent(this.isDoubleContent, this.isOverlayStyle);

  @override
  Widget build(BuildContext context) {
    final List<Widget> contentItems = [
      ProfessionalSummaryGroup(),
      AppUiConst.vsep16,

      if (!isDoubleContent)
        ...[
          ProfessionalExperienceGroup(false),
          AppUiConst.vsep16
        ],

      EducationGroup(),
      AppUiConst.vsep16,
      CoursesAndBooksGroup(),
      AppUiConst.vsep16,

      ItemsGroup(
        AppIcons.language,
        AppStrings.languagesTitle,
        AppStrings.languagePtText,
        AppStrings.languageEnText
      ),
      AppUiConst.vsep16,

      ItemsGroup(
        AppIcons.availability,
        AppStrings.availabilityTitle,
        AppStrings.availabilityContractText,
        AppStrings.availabilityFreelanceText
      )
    ];

    final Widget contentWidget = isDoubleContent
      ? Row(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 0, 12),
                child: ProfessionalExperienceGroup(true)
              )
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: AppListView(children: contentItems)
              )
            )
          ]
        )
      : AppListView(
          padding: EdgeInsets.fromLTRB(12, isOverlayStyle ? 0 : 24, 12, 12),
          children: contentItems
        );

    return isOverlayStyle
      ? contentWidget
      : Material(
          color: AppTheme.midLightColor,
          child: SafeArea(
            child: contentWidget
          )
        );
  }
}