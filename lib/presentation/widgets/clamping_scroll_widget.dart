import 'package:flutter/material.dart';

/// Refresh indicator without scrollview
/// https://stackoverflow.com/questions/50195259/refresh-indicator-without-scrollview

class ClampingScrollWidget extends StatelessWidget {
  const ClampingScrollWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      // Customize scroll behavior for both platforms
      behavior: _ClampingScrollBehavior(),
      child: child,
    );
  }
}

// NOTE: this is really important, it will make overscroll look the same on both platforms
class _ClampingScrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      const ClampingScrollPhysics();
}
