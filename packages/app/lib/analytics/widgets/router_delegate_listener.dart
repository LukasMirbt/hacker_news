import 'package:app/analytics/analytics.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nested/nested.dart';

class RouterDelegateListener extends SingleChildStatefulWidget {
  const RouterDelegateListener({super.key});

  @override
  State<RouterDelegateListener> createState() => _RouterDelegateListenerState();
}

class _RouterDelegateListenerState
    extends SingleChildState<RouterDelegateListener> {
  late final GoRouterDelegate _routerDelegate;

  void _listener() {
    final fullPath = _routerDelegate.state.fullPath;
    if (fullPath != null) {
      context.read<AnalyticsBloc>().add(
        AnalyticsFullPathChanged(fullPath),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    final goRouter = GoRouter.of(context);
    _routerDelegate = goRouter.routerDelegate;
    _routerDelegate.addListener(_listener);
  }

  @override
  void dispose() {
    _routerDelegate.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return child ?? const SizedBox.shrink();
  }
}
