import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AppListView extends StatelessWidget {
  final Color scrollbarColor;
  final EdgeInsets padding;
  final List<Widget> children;

  AppListView(this.scrollbarColor, this.padding, this.children);

  @override
  Widget build(BuildContext context) {
    ScrollController controller = ScrollController(keepScrollOffset: false);
    return AppScrollbar(
      scrollbarColor,
      controller,
      ListView(
        controller: controller,
        cacheExtent: double.infinity,
        padding: padding,
        children: children
      )
    );
  }
}

class AppSliverScroller extends StatelessWidget {
  final Color scrollbarColor;
  final List<Widget> slivers;

  AppSliverScroller(this.scrollbarColor, this.slivers);

  @override
  Widget build(BuildContext context) {
    ScrollController controller = ScrollController(keepScrollOffset: false);
    return AppScrollbar(
      scrollbarColor,
      controller,
      CustomScrollView(
        controller: controller,
        cacheExtent: double.infinity,
        slivers: slivers
      )
    );
  }
}

class AppScrollbar extends RawScrollbar {
  AppScrollbar(Color color, ScrollController controller, Widget child)
    :
    super(
      thickness: 4,
      thumbColor: color,
      controller: controller,
      child: child
    );
}

class AppScrollBehavior extends ScrollBehavior {
  static const ScrollPhysics _physics = BouncingScrollPhysics();

  @override
  Widget buildScrollbar(BuildContext context, Widget child, ScrollableDetails details) => child;

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) => _physics;

  @override
  Set<PointerDeviceKind> get dragDevices {
    Set<PointerDeviceKind> newSet = {};
    newSet.addAll(super.dragDevices);
    newSet.add(PointerDeviceKind.mouse);
    return newSet;
  }
}