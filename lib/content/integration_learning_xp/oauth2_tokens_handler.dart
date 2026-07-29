import 'package:flutter/widgets.dart';

import '../../ui/assets.dart';
import '../../ui/strings/strings_provider.dart';
import '../../ui/viewer/project.dart';
import '../../ui/viewer/project_code.dart';
import '../../ui/viewer/project_image.dart';

class OAuth2TokensHandlerProject extends Project {
  OAuth2TokensHandlerProject()
    : super(
        Strings.integrationProjectOAuth2TokensHandlerTitle,
        StringsProvider.strings.integrationProjectOAuth2TokensHandlerDescription,
        StringsProvider.strings.integrationProjectOAuth2TokensHandlerInfo,
        AppAssets.oauth2TokensHandlerAssets
      );

  @override
  List<Widget> buildPlaceholderWidgets() {
    return [
      ProjectImageWidget(assets.getFile(1)),
      ProjectCodeWidget(assets, [2])
    ];
  }
}