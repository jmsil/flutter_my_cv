import 'package:flutter/material.dart';

import '../ui/const.dart';
import '../ui/container/content_group.dart';
import '../ui/container/header_expandable.dart';
import '../ui/scroller.dart';
import '../ui/strings.dart';
import '../ui/text.dart';
import '../ui/theme.dart';

class AppContent extends StatelessWidget {
  final bool isOverlayStyle;

  AppContent(this.isOverlayStyle);

  @override
  Widget build(BuildContext context) {
    final Widget listView = AppListView(
      AppTheme.darkBlue.withOpacity(0.5),
      EdgeInsets.fromLTRB(12, isOverlayStyle ? 0 : 24, 12, 12),
      [
        _ProfessionalSummaryGroup(),
        _ProfessionalExperienceGroup(),
        _EducationGroup(),
        _CoursesGroup(),

        // Languages
        _ItemsGroup(
          AppIcons.language,
          CvStrings.languagesTitle,
          CvStrings.languagePtText,
          CvStrings.languageEnText
        ),

        // Availability
        _ItemsGroup(
          AppIcons.availability,
          CvStrings.availabilityTitle,
          CvStrings.availabilityContractText,
          CvStrings.availabilityFreelanceText
        )
      ]
    );

    return isOverlayStyle
      ? listView
      : Material(
          color: AppTheme.midLightColor,
          child: SafeArea(
            child: listView
          )
        );
  }
}



class _ProfessionalSummaryGroup extends ContentGroup {
  _ProfessionalSummaryGroup()
    :
    super(
      AppIcons.summary,
      CvStrings.professionalSummaryTitle,
      [
        Text(CvStrings.professionalSummaryText, style: AppTheme.normalDarkStyle)
      ]
    );
}

class _EducationGroup extends ContentGroup {
  _EducationGroup()
    :
    super(
      AppIcons.education,
      CvStrings.educationTitle,
      [
        Text(CvStrings.educationUniversityTitle, style: AppTheme.normalDarkBlueBoldStyle),
        Text('2006 - 2008', style: AppTheme.normalDarkBlueItalicStyle),
        AppUiConst.vsep16,
        Text(CvStrings.educationUniversityText, style: AppTheme.normalDarkStyle)
      ]
    );
}

class _CoursesGroup extends ContentGroup {
  _CoursesGroup()
    :
    super(
      AppIcons.course,
      CvStrings.coursesTitle,
      [
        Text(CvStrings.coursesOracleTitle, style: AppTheme.normalDarkBlueBoldStyle),
        Text('2010', style: AppTheme.normalDarkBlueItalicStyle),
        AppUiConst.vsep16,
        Text(CvStrings.coursesOracleText, style: AppTheme.normalDarkStyle)
      ]
    );
}

class _ItemsGroup extends ContentGroup {
  _ItemsGroup(IconData icon, String title, String item1, String item2)
    :
    super(
      icon, title,
      [
        AppIconText(AppIcons.arrow_right, item1, false),
        AppUiConst.vsep8,
        AppIconText(AppIcons.arrow_right, item2, false)
      ]
    );
}

class _ProfessionalExperienceGroup extends StatelessWidget {
  final List<Widget> children = [];

  @override
  Widget build(BuildContext context) {
    addSubgroupToChildren(
      CvStrings.flutterExperienceTitle, '2021', null,
      CvStrings.flutterExperienceText, true
    );

    addSubgroupToChildren(
      CvStrings.mobileGameExperienceTitle, '2013 - 2020', null,
      CvStrings.mobileGameExperienceText, true
    );

    addSubgroupToChildren(
      CvStrings.santriExperienceTitle, CvStrings.santriExperiencePeriod,
      AppIconText(AppIcons.link, 'https://www.santri.com.br', false, true),
      CvStrings.santriExperienceText, true
    );

    addSubgroupToChildren(
      CvStrings.smallERPTitle, '2006/2007', null,
      CvStrings.smallERPText, false
    );

    return ContentGroup(
      AppIcons.experience,
      CvStrings.professionalExperienceTitle,
      children,
      false
    );
  }

  void addSubgroupToChildren(
      String title,
      String period,
      Widget? fixedContent,
      String expandableContent,
      bool addSeparator
    )
  {
    final Widget child = AppHeaderExpandable(
      headerContent: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTheme.normalDarkBlueBoldStyle),
          Text(period, style: AppTheme.normalDarkBlueItalicStyle)
        ]
      ),
      fixedContent: fixedContent,
      expandableContent: Text(expandableContent, style: AppTheme.normalDarkStyle)
    );
    children.add(child);

    if (addSeparator)
      children.add(AppUiConst.vsep16);
  }
}