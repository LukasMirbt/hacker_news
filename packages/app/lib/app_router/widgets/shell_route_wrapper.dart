import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShellRouteWrapper extends StatelessWidget {
  const ShellRouteWrapper({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    bool canPop;

    final lastMatch = GoRouter.of(
      context,
    ).routerDelegate.currentConfiguration.matches.lastOrNull;

    if (lastMatch is ShellRouteMatch) {
      canPop = lastMatch.matches.length == 1;
    } else {
      canPop = true;
    }

    return PopScope(
      canPop: canPop,
      child: child,
    );
  }
}
