import 'package:flutter/material.dart';

import '../ui/const.dart';
import '../ui/strings.dart';
import '../ui/theme.dart';
import 'group.dart';

class EducationGroup extends ContentGroup {
  EducationGroup()
    : super(
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