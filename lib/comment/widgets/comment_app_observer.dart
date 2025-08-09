import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/comment/comment.dart';

class CommentAppObserver extends StatefulWidget {
  const CommentAppObserver({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  State<CommentAppObserver> createState() => CommentAppObserverState();
}

class CommentAppObserverState extends State<CommentAppObserver>
    with WidgetsBindingObserver {
  AppLifecycleState _previousState = AppLifecycleState.resumed;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (_previousState == AppLifecycleState.resumed &&
        state == AppLifecycleState.inactive) {
      context.read<CommentBloc>().add(
        const CommentAppInactivated(),
      );
    }

    _previousState = state;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
