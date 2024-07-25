import 'package:flutter/material.dart';

class CustomScrollPhysics extends ScrollPhysics {
  final bool disableLeftSwipe;

  CustomScrollPhysics({this.disableLeftSwipe = false, ScrollPhysics? parent})
      : super(parent: parent);

  @override
  CustomScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CustomScrollPhysics(
      disableLeftSwipe: disableLeftSwipe,
      parent: buildParent(ancestor),
    );
  }

  @override
  double applyPhysicsToUserOffset(ScrollMetrics metrics, double offset) {
    if (disableLeftSwipe && offset < 0) { // disable left swipe
      return 0.0;
    }
    return super.applyPhysicsToUserOffset(metrics, offset);
  }

  @override
  bool shouldAcceptUserOffset(ScrollMetrics metrics) {
    if (disableLeftSwipe) {
      return !metrics.atEdge || metrics.pixels == 0;
    }
    return super.shouldAcceptUserOffset(metrics);
  }
}


class CustomPageView extends StatefulWidget {
  final PageController controller;
  final ValueChanged<int> onPageChanged;
  final List<Widget> children;
  final int selectedIndex;

  CustomPageView({
    required this.controller,
    required this.onPageChanged,
    required this.children,
    required this.selectedIndex,
  });

  @override
  _CustomPageViewState createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: widget.controller,
          onPageChanged: widget.onPageChanged,
          children: widget.children,
          physics: CustomScrollPhysics(disableLeftSwipe: true),
        ),
        GestureDetector(
          onHorizontalDragUpdate: (details) {
            if (details.primaryDelta! > 0) {
              // left swipe
              if (widget.selectedIndex != 0) {
                widget.controller.jumpToPage(0);
                widget.onPageChanged(0);
              }
            }
          },
        ),
      ],
    );
  }
}

