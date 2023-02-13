import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AppListView extends StatelessWidget {
  final EdgeInsets padding;
  final List<Widget> children;

  AppListView(this.padding, this.children);

  @override
  Widget build(BuildContext context) {
    return ListView(
      primary: false,
      cacheExtent: double.infinity,
      padding: padding,
      children: children
    );
  }
}

class AppSliverScroller extends StatelessWidget {
  final List<Widget> slivers;

  AppSliverScroller(this.slivers);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      primary: false,
      cacheExtent: double.infinity,
      slivers: slivers
    );
  }
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