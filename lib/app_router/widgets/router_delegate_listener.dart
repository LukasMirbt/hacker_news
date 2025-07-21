import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/app_router/bloc/bloc.dart';
import 'package:nested/nested.dart';

class RouterDelegateListener extends SingleChildStatefulWidget {
  const RouterDelegateListener({super.key});

  @override
  State<RouterDelegateListener> createState() => _RouterDelegateListenerState();
}

class _RouterDelegateListenerState
    extends SingleChildState<RouterDelegateListener> {
  @override
  void initState() {
    super.initState();
    final state = context.read<AppRouter>().state;
    final routerDelegate = state.goRouter.routerDelegate;
    routerDelegate.addListener(() {
      final matchedLocation = routerDelegate.state.matchedLocation;
      context.read<AppRouter>().updateLocation(matchedLocation);
    });
  }

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return child ?? const SizedBox.shrink();
  }
}
