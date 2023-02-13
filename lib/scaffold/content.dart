import 'package:flutter/material.dart';

import '../ui/const.dart';
import '../ui/container/content_group.dart';
import '../ui/container/header_expandable.dart';
import '../ui/scroller.dart';
import '../ui/strings.dart';
import '../ui/text.dart';
import '../ui/theme.dart';

class AppContent extends StatelessWidget {
  final bool isDoubleContent;
  final bool isOverlayStyle;

  AppContent(this.isDoubleContent, this.isOverlayStyle);

  @override
  Widget build(BuildContext context) {
    final Widget languagesWidget = _ItemsGroup(
      AppIcons.language,
      AppStrings.languagesTitle,
      AppStrings.languagePtText,
      AppStrings.languageEnText
    );

    final Widget availabilityWidget = _ItemsGroup(
      AppIcons.availability,
      AppStrings.availabilityTitle,
      AppStrings.availabilityContractText,
      AppStrings.availabilityFreelanceText
    );

    final Widget contentWidget = isDoubleContent
      ? Row(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 0, 12),
                child: _ProfessionalExperienceGroup(true)
              )
            ),
            Expanded(
              flex: 2,
              child: AppListView(
                AppTheme.darkBlue.withOpacity(0.5),
                const EdgeInsets.all(12),
                [
                  _ProfessionalSummaryGroup(),
                  AppUiConst.vsep16,
                  _EducationGroup(),
                  AppUiConst.vsep16,
                  _CoursesAndBooksGroup(),
                  AppUiConst.vsep16,
                  languagesWidget,
                  AppUiConst.vsep16,
                  availabilityWidget
                ]
              )
            )
          ]
        )
      : AppListView(
          AppTheme.darkBlue.withOpacity(0.5),
          EdgeInsets.fromLTRB(12, isOverlayStyle ? 0 : 24, 12, 12),
          [
            _ProfessionalSummaryGroup(),
            AppUiConst.vsep16,
            _ProfessionalExperienceGroup(false),
            AppUiConst.vsep16,
            _EducationGroup(),
            AppUiConst.vsep16,
            _CoursesAndBooksGroup(),
            AppUiConst.vsep16,
            languagesWidget,
            AppUiConst.vsep16,
            availabilityWidget
          ]
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



class _ProfessionalSummaryGroup extends ContentGroup {
  _ProfessionalSummaryGroup()
    :
    super(
      icon: AppIcons.summary,
      title: AppStrings.professionalSummaryTitle,
      children: [
        Text(AppStrings.professionalSummaryText, style: AppTheme.normalDarkStyle)
      ]
    );
}

class _EducationGroup extends ContentGroup {
  _EducationGroup()
    :
    super(
      icon: AppIcons.education,
      title: AppStrings.educationTitle,
      children: [
        Text(AppStrings.educationUniversityTitle, style: AppTheme.normalDarkBlueBoldStyle),
        Text('2006 - 2008', style: AppTheme.normalDarkBlueItalicStyle),
        AppUiConst.vsep16,
        Text(AppStrings.educationUniversityText, style: AppTheme.normalDarkStyle)
      ]
    );
}

class _ItemsGroup extends ContentGroup {
  _ItemsGroup(IconData icon, String title, String item1, String item2)
    :
    super(
      icon: icon,
      title: title,
      children: [
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
    addChild(
      "Clean Architecture - A Craftsman's Guide to Software structure and Design",
      'Robert C. Martin',
      false, true
    );

    addChild(
      'Clean Code - A Handbook of Agile Sortware Craftsmanship',
      'Robert C. Martin',
      false, true
    );

    addChild(AppStrings.courseOracleOcaOcpTitle, '2010', true, false);

    return ContentGroup(
      icon: AppIcons.studying,
      title: AppStrings.coursesAndBooksTitle,
      children: children
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
  final bool hasListView;
  final List<Widget> children = [];

  _ProfessionalExperienceGroup(this.hasListView);

  @override
  Widget build(BuildContext context) {
    addChild(
      AppStrings.fortlevExperienceTitle, AppStrings.fortlevExperiencePeriod,
      Column(
        children: [
          AppIconText(AppIcons.link, 'https://www.bci-consulting.com', false, true),
          AppUiConst.vsep8,
          AppIconText(AppIcons.link, 'https://www.fortlev.com.br', false, true)
        ]
      ),
      AppStrings.fortlevExperienceText, true
    );

    addChild(
      AppStrings.flutterExperienceTitle, '2021', null,
      AppStrings.flutterExperienceText, true
    );

    addChild(
      AppStrings.mobileGameExperienceTitle, '2013 - 2020', null,
      AppStrings.mobileGameExperienceText, true
    );

    addChild(
      AppStrings.santriExperienceTitle, AppStrings.santriExperiencePeriod,
      AppIconText(AppIcons.link, 'https://www.santri.com.br', false, true),
      AppStrings.santriExperienceText, true
    );

    addChild(
      AppStrings.smallERPTitle, '2006/2007', null,
      AppStrings.smallERPText, false
    );

    return ContentGroup(
      icon: AppIcons.experience,
      title: AppStrings.professionalExperienceTitle,
      hasPadding: false,
      hasListView: hasListView,
      children: children
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