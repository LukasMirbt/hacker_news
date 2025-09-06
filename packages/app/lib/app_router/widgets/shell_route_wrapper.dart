import 'package:app/app_router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Workaround for ShellRoute breaking iOS back gesture
// https://github.com/flutter/flutter/issues/120353
class ShellRouteWrapper extends StatelessWidget {
  const ShellRouteWrapper({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final shellRouteCanPop = context.select(
      (AppRouter router) => router.shellRouteCanPop,
    );

    return PopScope(
      canPop: shellRouteCanPop,
      child: child,
    );
  }
}
