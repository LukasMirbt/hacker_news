import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/post/post.dart';

class PostRefreshIndicator extends StatefulWidget {
  const PostRefreshIndicator({
    required this.child,
    this.createCompleter = Completer<void>.new,
    super.key,
  });

  final Widget child;
  final Completer<void> Function() createCompleter;

  @override
  State<PostRefreshIndicator> createState() => _PostRefreshIndicatorState();
}

class _PostRefreshIndicatorState extends State<PostRefreshIndicator> {
  late Completer<void> _completer;

  @override
  Widget build(BuildContext context) {
    return BlocListener<PostBloc, PostState>(
      listenWhen: (previous, current) =>
          previous.refreshStatus.isLoading && !current.refreshStatus.isLoading,
      listener: (context, state) {
        _completer.complete();
      },
      child: RefreshIndicator(
        onRefresh: () {
          _completer = widget.createCompleter();
          context.read<PostBloc>().add(
            const PostRefreshTriggered(),
          );
          return _completer.future;
        },
        child: widget.child,
      ),
    );
  }
}
