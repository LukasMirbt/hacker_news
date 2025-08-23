import 'package:app/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentAppObserver extends StatefulWidget {
  const CommentAppObserver({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  State<CommentAppObserver> createState() => _CommentAppObserverState();
}

class _CommentAppObserverState extends State<CommentAppObserver> {
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
          context.read<CommentBloc>().add(
            const CommentAppInactivated(),
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
