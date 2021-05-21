import 'package:flutter/material.dart';

class CvScroller extends StatelessWidget {
  final Color scrollbarColor;
  final Widget child;

  CvScroller(this.scrollbarColor, this.child);

  @override
  Widget build(BuildContext context) {
    ScrollController controller = ScrollController(keepScrollOffset: false);
    return CvScrollbar(
      scrollbarColor,
      controller,
      SingleChildScrollView(
        controller: controller,
        child: child
      )
    );
  }
}

class CvSliverScroller extends StatelessWidget {
  final Color scrollbarColor;
  final List<Widget> slivers;

  CvSliverScroller(this.scrollbarColor, this.slivers);

  @override
  Widget build(BuildContext context) {
    ScrollController controller = ScrollController(keepScrollOffset: false);
    return CvScrollbar(
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

class CvScrollbar extends RawScrollbar {
  CvScrollbar(Color color, ScrollController controller, Widget child)
    :
    super(
      thickness: 4,
      thumbColor: color,
      isAlwaysShown: true,
      controller: controller,
      child: child
    );
}

class CvScrollBehavior extends ScrollBehavior {
  static const ScrollPhysics _physics = BouncingScrollPhysics();

  @override
  Widget buildScrollbar(BuildContext context, Widget child, ScrollableDetails details) => child;

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) => _physics;
}