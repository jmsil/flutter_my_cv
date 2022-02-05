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
        _CoursesAndBooksGroup(),

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

class _CoursesAndBooksGroup extends StatelessWidget {
  final List<Widget> children = [];

  @override
  Widget build(BuildContext context) {
    addChild(CvStrings.courseOracleOcaOcpTitle, '2010', true, true);

    addChild(
      'Clean Code - A Handbook of Agile Sortware Craftsmanship',
      'Robert C. Martin',
      false, false
    );

    return ContentGroup(
      AppIcons.studying,
      CvStrings.coursesAndBooksTitle,
      children
    );
  }

  addChild(String title, String detail, bool isCourse, bool addSeparator) {
    final Widget child = Row(
      children: [
        Icon(isCourse ? AppIcons.course : AppIcons.book, color: AppTheme.darkBlue),
        AppUiConst.hsep8,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title, style: AppTheme.normalDarkBlueBoldStyle,
                softWrap: false,
                overflow: TextOverflow.fade,
              ),
              Text(detail, style: AppTheme.normalDarkBlueItalicStyle)
            ]
          )
        )
      ]
    );
    children.add(child);

    if (addSeparator)
      children.add(AppUiConst.vsep16);
  }
}

class _ProfessionalExperienceGroup extends StatelessWidget {
  final List<Widget> children = [];

  @override
  Widget build(BuildContext context) {
    addChild(
      CvStrings.fortlevExperienceTitle, CvStrings.fortlevExperiencePeriod,
      Column(
        children: [
          AppIconText(AppIcons.link, 'https://www.bci-consulting.com', false, true),
          AppUiConst.vsep8,
          AppIconText(AppIcons.link, 'https://www.fortlev.com.br', false, true)
        ]
      ),
      CvStrings.fortlevExperienceText, true
    );

    addChild(
      CvStrings.flutterExperienceTitle, '2021', null,
      CvStrings.flutterExperienceText, true
    );

    addChild(
      CvStrings.mobileGameExperienceTitle, '2013 - 2020', null,
      CvStrings.mobileGameExperienceText, true
    );

    addChild(
      CvStrings.santriExperienceTitle, CvStrings.santriExperiencePeriod,
      AppIconText(AppIcons.link, 'https://www.santri.com.br', false, true),
      CvStrings.santriExperienceText, true
    );

    addChild(
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

  void addChild(
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