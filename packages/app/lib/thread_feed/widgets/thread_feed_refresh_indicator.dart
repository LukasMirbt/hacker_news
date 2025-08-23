import 'dart:async';

import 'package:app/thread_feed/thread_feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThreadFeedRefreshIndicator extends StatefulWidget {
  const ThreadFeedRefreshIndicator({
    required this.child,
    this.createCompleter = Completer<void>.new,
    super.key,
  });

  final Widget child;
  final Completer<void> Function() createCompleter;

  @override
  State<ThreadFeedRefreshIndicator> createState() =>
      _ThreadFeedRefreshIndicatorState();
}

class _ThreadFeedRefreshIndicatorState
    extends State<ThreadFeedRefreshIndicator> {
  late Completer<void> _completer;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ThreadFeedBloc, ThreadFeedState>(
      listenWhen: (previous, current) =>
          previous.refreshStatus.isLoading && !current.refreshStatus.isLoading,
      listener: (context, state) {
        _completer.complete();
      },
      child: RefreshIndicator(
        onRefresh: () {
          _completer = widget.createCompleter();
          context.read<ThreadFeedBloc>().add(
            const ThreadFeedRefreshTriggered(),
          );
          return _completer.future;
        },
        child: widget.child,
      ),
    );
  }
}
