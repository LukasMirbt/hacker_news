import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/thread_list/thread_list.dart';

class ThreadListRefreshIndicator extends StatefulWidget {
  const ThreadListRefreshIndicator({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  State<ThreadListRefreshIndicator> createState() =>
      _ThreadListRefreshIndicatorState();
}

class _ThreadListRefreshIndicatorState
    extends State<ThreadListRefreshIndicator> {
  late Completer<void> _completer;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ThreadListBloc, ThreadListState>(
      listenWhen: (previous, current) =>
          previous.refreshStatus.isLoading && !current.refreshStatus.isLoading,
      listener: (context, state) {
        _completer.complete();
      },
      child: RefreshIndicator(
        onRefresh: () async {
          _completer = Completer<void>();
          context.read<ThreadListBloc>().add(
            const ThreadListRefreshTriggered(),
          );
          await _completer.future;
        },
        child: widget.child,
      ),
    );
  }
}
