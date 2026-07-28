import 'package:flutter/material.dart';

import '../../ui/layout/layout.dart';
import '../../ui/layout/theme.dart';
import '../../ui/strings/strings_provider.dart';
import '../../ui/viewer/project.dart';
import '../expandable.dart';
import 'apim_proxy.dart';
import 'calculator.dart';
import 'conversions_ftp.dart';
import 'exception_handler.dart';
import 'iflow_proxy.dart';
import 'sql_server_xslt.dart';

class IntegrationLearningExperience extends ExpandableContent {
  IntegrationLearningExperience(AppTheme theme)
    : super(
        headerTitle: StringsProvider.strings.sapIntegrationSuiteLearningJourneyTitle,
        headerDetail: StringsProvider .strings.sapIntegrationSuiteLearningJourneyDetail,
        infoWidget: Column(
          spacing: AppLayout.normalSpacing,
          children: [
            ProjectTileWidget(theme, ApimProxyProject()),
            ProjectTileWidget(theme, IFlowProxyProject()),
            ProjectTileWidget(theme, ExceptionHandlerProject()),
            ProjectTileWidget(theme, SqlServerXsltProject()),
            ProjectTileWidget(theme, CalculatorProject()),
            ProjectTileWidget(theme, ConversionsFtpProject())
          ]
        ),
        startOpen: true
      );
}