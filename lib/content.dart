import 'package:flutter/material.dart';
import 'package:my_cv/scroller.dart';
import 'package:my_cv/separator.dart';
import 'package:my_cv/strings.dart';
import 'package:my_cv/text.dart';

class CvContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CvSep.verEdgeInsets32,
      child: CvScroller(
        Colors.blue,
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            // Professional Summary
            CvContentTitleWithBkg(CvStrings.professionalSummaryTitle),
            _ContentPadding(
              [
                CvSep.sep16,
                CvNormalText(CvStrings.professionalSummaryText, false),
                CvSep.sep40
              ]
            ),

            // Professional Experience
            CvContentTitleWithBkg(CvStrings.professionalExperienceTitle),
            _ContentPadding(
              [
                CvSep.sep16,

                CvContentTitle(CvStrings.flutterExperienceTitle, false),
                CvContentTitle('2021', true),
                CvSep.sep16,
                CvNormalText(CvStrings.flutterExperienceText, false),
                CvSep.sep40,

                CvContentTitle(CvStrings.mobileGameExperienceTitle, false),
                CvContentTitle('2013 - 2020', true),
                CvSep.sep16,
                CvNormalText(CvStrings.mobileGameExperienceText, false),
                CvSep.sep40,

                CvContentTitle(CvStrings.santriExperienceTitle, false),
                CvContentTitle(CvStrings.santriExperiencePeriod, true),
                CvSep.sep16,
                CvLink('https://www.santri.com.br', false),
                CvSep.sep16,
                CvNormalText(CvStrings.santriExperienceText, false),
                CvSep.sep40,

                CvContentTitle(CvStrings.smallERPTitle, false),
                CvContentTitle('2006/2007', true),
                CvSep.sep16,
                CvNormalText(CvStrings.smallERPText, false),
                CvSep.sep40
              ]
            ),

            // Education
            CvContentTitleWithBkg(CvStrings.educationTitle),
            _ContentPadding(
              [
                CvSep.sep16,
                CvContentTitle(CvStrings.educationUniversityTitle, false),
                CvContentTitle('2006 - 2008', true),
                CvSep.sep16,
                CvNormalText(CvStrings.educationUniversityText, false),
                CvSep.sep40
              ]
            ),

            // Courses
            CvContentTitleWithBkg(CvStrings.coursesTitle),
            _ContentPadding(
              [
                CvSep.sep16,
                CvContentTitle(CvStrings.coursesOracleTitle, false),
                CvContentTitle('2010', true),
                CvSep.sep16,
                CvNormalText(CvStrings.coursesOracleText, false),
                CvSep.sep40
              ]
            ),

            // Languages
            CvContentTitleWithBkg(CvStrings.languagesTitle),
            _ContentPadding(
              [
                CvSep.sep16,
                CvContentTextWithIcon(CvStrings.languagePtText),
                CvSep.sep8,
                CvContentTextWithIcon(CvStrings.languageEnText),
                CvSep.sep40
              ]
            ),

            // Availability
            CvContentTitleWithBkg(CvStrings.availabilityTitle),
            _ContentPadding(
              [
                CvSep.sep16,
                CvContentTextWithIcon(CvStrings.availabilityContractText),
                CvSep.sep8,
                CvContentTextWithIcon(CvStrings.availabilityFreelanceText)
              ]
            )
          ]
        )
      )
    );
  }
}

class _ContentPadding extends StatelessWidget {
  final List<Widget> children;

  _ContentPadding(this.children);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CvSep.horEdgeInsets32,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children
      )
    );
  }
}