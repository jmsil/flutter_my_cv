import 'package:flutter/widgets.dart';

import '../../ui/assets.dart';
import '../../ui/strings/strings_provider.dart';
import '../../ui/viewer/project.dart';
import '../../ui/viewer/project_image.dart';

class ApimProxyProject extends Project {
  ApimProxyProject()
    : super(
        Strings.integrationProjectApimProxyTitle,
        StringsProvider.strings.integrationProjectApimProxyDescription,
        StringsProvider.strings.integrationProjectApimProxyInfo,
        AppAssets.apimProxyAssets
      );

  @override
  List<Widget> buildPlaceholderWidgets() {
    return [
      ProjectImageWidget(assets.getFile(1))
    ];
  }
}