import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:my_cv/ui/button/ink_response.dart';
import 'package:re_editor/re_editor.dart';
import 'package:re_highlight/languages/groovy.dart';
import 'package:re_highlight/languages/json.dart';
import 'package:re_highlight/languages/xml.dart';
import 'package:re_highlight/styles/vs2015.dart';

import '../../scaffold/device.dart';
import '../assets.dart';
import '../container/container.dart';
import '../hover.dart';
import '../layout/edge_insets.dart';
import '../layout/icons.dart';
import '../layout/layout_provider.dart';
import 'viewer.dart';

class ProjectCodeWidget extends StatelessWidget {
  static const double editorHeight = 326;

  final AssetsArchive assets;
  final List<int> assetsIds;
  final List<int> horizonalFlexes;

  ProjectCodeWidget(this.assets, this.assetsIds, [this.horizonalFlexes = const []]);

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.appLayout.theme;
    final double screenWidth = context.screenSize.width;
    final List<Widget> children = [];

    final bool isHorizontalDirection =
      screenWidth / assetsIds.length >= 400 ||
      assetsIds.length == 1;

    for (int id in assetsIds) {
      Widget editorWidget = _CodeEditor(theme, assets.getFile(id));
      Widget widget = isHorizontalDirection
        ? Expanded(
            flex: horizonalFlexes.isEmpty ? 1 : horizonalFlexes[assetsIds.indexOf(id)],
            child: editorWidget
          )
        : SizedBox(
            height: editorHeight,
            child: _Expandable(editorWidget)
          );
      children.add(widget);
    }

    final Widget builtWidget = Flex(
      direction: isHorizontalDirection ? Axis.horizontal : Axis.vertical,
      spacing: AppLayout.normalSpacing,
      children: children
    );

    return isHorizontalDirection
      ? SizedBox(
          height: editorHeight,
          child: _Expandable(builtWidget)
        )
      : builtWidget;
  }
}

class _CodeEditor extends CodeEditor {
  _CodeEditor(AppTheme theme, Uint8List code)
    : super(
        readOnly: true,
        wordWrap: false,
        borderRadius: AppTheme.allBorderRadius,
        controller: CodeLineEditingController.fromText(utf8.decode(code)),
        style: CodeEditorStyle(
          fontSize: theme.text1FontSize,
          textColor: theme.backgroundColor,
          cursorColor: theme.backgroundColor,
          backgroundColor: theme.elementColor1,
          selectionColor: theme.elementColor3.withValues(alpha: 0.25),
          codeTheme: CodeHighlightTheme(
            languages: {
              'xml': CodeHighlightThemeMode(mode: langXml),
              'json': CodeHighlightThemeMode(mode: langJson),
              'groovy': CodeHighlightThemeMode(mode: langGroovy)
            },
            theme: vs2015Theme
          )
        ),
        indicatorBuilder: (context, editingController, chunkController, notifier) {
          return Padding(
            padding: const EdgeInsets.only(
              left: AppEdgeInsets.smallValue,
              right: AppEdgeInsets.normalValue
            ),
            child: DefaultCodeLineNumber(
              controller: editingController,
              notifier: notifier
            )
          );
        },
        leadingDivider: VerticalDivider(
          width: 1,
          color: theme.elementColor3.withValues(alpha: 0.32)
        )
      );
}

class _Expandable extends StatelessWidget {
  final Widget child;

  _Expandable(this.child);

  @override
  Widget build(BuildContext context) {
    return AppDevice.isMobileDevice()
      ? overlayBuilder(context, true, child)
      : AppHoverWidget(
          child: child,
          builder: overlayBuilder
        );
  }

  Widget overlayBuilder(BuildContext context, bool hovered, Widget? child) {
    final AppTheme theme = context.appLayout.theme;
    final isInFullWindowMode = AppViewer.isInFullWindowOf(context);
    final List<Widget> children = [ child! ];

    if (hovered) {
      Widget button = Align(
        alignment: Alignment.topRight,
        child: AppContainer(
          borderRadius: const BorderRadius.only(
            topRight: AppTheme.radius,
            bottomLeft: AppTheme.radius
          ),
          isClipped: true,
          child: AppInkResponse(
            padding: const AppEdgeInsets.normal(),
            effectsColor: theme.inkEffectsColor,
            child: Icon(
              isInFullWindowMode ? AppIcons.fullWindowExit : AppIcons.fullWindow,
              color: theme.overElement1Color1
            ),
            onPressed: () => onPressed(context, isInFullWindowMode)
          )
        )
      );
      children.add(button);
    }

    return Stack(
      clipBehavior: Clip.none,
      children: children
    );
  }

  void onPressed(BuildContext context, bool isInFullWindowMode) {
    AppViewer.setFullWindowOf(context, isInFullWindowMode ? null : this);
  }
}