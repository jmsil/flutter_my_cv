import 'package:flutter/material.dart';

import '../../ui/const.dart';
import '../../ui/container/header_expandable.dart';
import '../../ui/scroller.dart';
import '../../ui/strings.dart';
import '../../ui/text.dart';
import '../../ui/theme.dart';
import 'content_group.dart';
import 'education.dart';
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
          _ProfessionalExperienceGroup(false),
          AppUiConst.vsep16
        ],

      EducationGroup(),
      AppUiConst.vsep16,
      _CoursesAndBooksGroup(),
      AppUiConst.vsep16,

      _ItemsGroup(
        AppIcons.language,
        AppStrings.languagesTitle,
        AppStrings.languagePtText,
        AppStrings.languageEnText
      ),
      AppUiConst.vsep16,

      _ItemsGroup(
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
                child: _ProfessionalExperienceGroup(true)
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
        Icon(isCourse ? AppIcons.course : AppIcons.book, color: AppTheme.darkColor),
        AppUiConst.hsep8,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title, style: AppTheme.normalDarkBoldStyle,
                softWrap: false,
                overflow: TextOverflow.fade,
              ),
              Text(detail, style: AppTheme.normalDarkItalicStyle)
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