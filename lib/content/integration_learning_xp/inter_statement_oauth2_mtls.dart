import 'package:flutter/widgets.dart';

import '../../ui/assets.dart';
import '../../ui/strings/strings_provider.dart';
import '../../ui/viewer/project.dart';
import '../../ui/viewer/project_image.dart';

class InterStatementOauth2MtlsProject extends Project {
  InterStatementOauth2MtlsProject()
    : super(
        Strings.integrationProjectInterStatementOauth2MtlsTitle,
        StringsProvider.strings.integrationProjectInterStatementOauth2MtlsDescription,
        StringsProvider.strings.integrationProjectInterStatementOauth2MtlsInfo,
        AppAssets.interStatementOauth2MtlsAssets
      );

  @override
  List<Widget> buildPlaceholderWidgets() {
    return [
      ProjectImageWidget(assets.getFile(1))
    ];
  }
}