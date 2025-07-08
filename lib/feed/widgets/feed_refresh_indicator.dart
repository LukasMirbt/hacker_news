import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/feed/feed.dart';

class FeedRefreshIndicator extends StatefulWidget {
  const FeedRefreshIndicator({
    required this.child,
    this.createCompleter = Completer<void>.new,
    super.key,
  });

  final Widget child;
  final Completer<void> Function() createCompleter;

  @override
  State<FeedRefreshIndicator> createState() => _FeedRefreshIndicatorState();
}

class _FeedRefreshIndicatorState extends State<FeedRefreshIndicator> {
  late Completer<void> _completer;

  @override
  Widget build(BuildContext context) {
    return BlocListener<FeedBloc, FeedState>(
      listenWhen: (previous, current) =>
          previous.refreshStatus.isLoading && !current.refreshStatus.isLoading,
      listener: (context, state) {
        _completer.complete();
      },
      child: RefreshIndicator(
        onRefresh: () {
          _completer = widget.createCompleter();
          context.read<FeedBloc>().add(
            const FeedRefreshTriggered(),
          );
          return _completer.future;
        },
        child: widget.child,
      ),
    );
  }
}
