import 'package:flutter/material.dart';

import 'const.dart';
import 'container.dart';
import 'content_group.dart';
import 'scroller.dart';
import 'strings.dart';
import 'text.dart';
import 'theme.dart';

class AppContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppContainer(
      color: AppTheme.midLightColor,
      child: AppListView(
        AppTheme.darkBlue.withOpacity(0.5),
        const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
        [
          // Professional Summary
          ContentGroup(
            AppIcons.summary,
            CvStrings.professionalSummaryTitle,
            [
              Text(CvStrings.professionalSummaryText, style: AppTheme.normalDarkStyle)
            ]
          ),

          // Professional Experience
          ContentGroup(
            AppIcons.experience,
            CvStrings.professionalExperienceTitle,
            [
              Text(CvStrings.flutterExperienceTitle, style: AppTheme.largeDarkBlueBoldStyle),
              Text('2021', style: AppTheme.normalDarkBlueItalicStyle),
              AppUiConst.vsep16,
              Text(CvStrings.flutterExperienceText, style: AppTheme.normalDarkStyle),
              AppUiConst.vsep40,

              Text(CvStrings.mobileGameExperienceTitle, style: AppTheme.largeDarkBlueBoldStyle),
              Text('2013 - 2020', style: AppTheme.normalDarkBlueItalicStyle),
              AppUiConst.vsep16,
              Text(CvStrings.mobileGameExperienceText, style: AppTheme.normalDarkStyle),
              AppUiConst.vsep40,

              Text(CvStrings.santriExperienceTitle, style: AppTheme.largeDarkBlueBoldStyle),
              Text(CvStrings.santriExperiencePeriod, style: AppTheme.normalDarkBlueItalicStyle),
              AppUiConst.vsep16,
              AppIconText(AppIcons.link, 'https://www.santri.com.br', false, true),
              AppUiConst.vsep16,
              Text(CvStrings.santriExperienceText, style: AppTheme.normalDarkStyle),
              AppUiConst.vsep40,

              Text(CvStrings.smallERPTitle, style: AppTheme.largeDarkBlueBoldStyle),
              Text('2006/2007', style: AppTheme.normalDarkBlueItalicStyle),
              AppUiConst.vsep16,
              Text(CvStrings.smallERPText, style: AppTheme.normalDarkStyle)
            ]
          ),

          // Education
          ContentGroup(
            AppIcons.education,
            CvStrings.educationTitle,
            [
              Text(CvStrings.educationUniversityTitle, style: AppTheme.largeDarkBlueBoldStyle),
              Text('2006 - 2008', style: AppTheme.normalDarkBlueItalicStyle),
              AppUiConst.vsep16,
              Text(CvStrings.educationUniversityText, style: AppTheme.normalDarkStyle)
            ]
          ),

          // Courses
          ContentGroup(
            AppIcons.course,
            CvStrings.coursesTitle,
            [
              Text(CvStrings.coursesOracleTitle, style: AppTheme.largeDarkBlueBoldStyle),
              Text('2010', style: AppTheme.normalDarkBlueItalicStyle),
              AppUiConst.vsep16,
              Text(CvStrings.coursesOracleText, style: AppTheme.normalDarkStyle)
            ]
          ),

          // Languages
          ContentGroup(
            AppIcons.language,
            CvStrings.languagesTitle,
            [
              AppIconText(AppIcons.arrow, CvStrings.languagePtText, false),
              AppUiConst.vsep8,
              AppIconText(AppIcons.arrow, CvStrings.languageEnText, false)
            ]
          ),

          // Availability
          ContentGroup(
            AppIcons.availability,
            CvStrings.availabilityTitle,
            [
              AppIconText(AppIcons.arrow, CvStrings.availabilityContractText, false),
              AppUiConst.vsep8,
              AppIconText(AppIcons.arrow, CvStrings.availabilityFreelanceText, false)
            ]
          )
        ]
      )
    );
  }
}