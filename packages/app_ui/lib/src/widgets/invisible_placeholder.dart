import 'package:flutter/material.dart';

class InvisiblePlaceholder extends StatelessWidget {
  const InvisiblePlaceholder({
    required this.visible,
    required this.child,
    super.key,
  });

  final bool visible;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      maintainSize: true,
      maintainState: true,
      maintainAnimation: true,
      visible: visible,
      child: child,
    );
  }
}
