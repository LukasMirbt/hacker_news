import 'package:app/reply/reply.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReplyAppObserver extends StatefulWidget {
  const ReplyAppObserver({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  State<ReplyAppObserver> createState() => _ReplyAppObserverState();
}

class _ReplyAppObserverState extends State<ReplyAppObserver> {
  late final AppLifecycleListener _listener;
  AppLifecycleState? _previousState = AppLifecycleState.resumed;

  @override
  void initState() {
    super.initState();
    _previousState = SchedulerBinding.instance.lifecycleState;
    _listener = AppLifecycleListener(
      onStateChange: (state) {
        if (_previousState == AppLifecycleState.resumed &&
            state == AppLifecycleState.inactive) {
          context.read<ReplyBloc>().add(
            const ReplyAppInactivated(),
          );
        }

        _previousState = state;
      },
    );
  }

  @override
  void dispose() {
    _listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
