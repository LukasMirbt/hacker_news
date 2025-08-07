import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/reply/reply.dart';

class ReplyAppObserver extends StatefulWidget {
  const ReplyAppObserver({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  State<ReplyAppObserver> createState() => ReplyAppObserverState();
}

class ReplyAppObserverState extends State<ReplyAppObserver>
    with WidgetsBindingObserver {
  AppLifecycleState _previousState = AppLifecycleState.resumed;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    print('App lifecycle changed: $state');
    if (_previousState == AppLifecycleState.resumed &&
        state == AppLifecycleState.inactive) {
      context.read<ReplyBloc>().add(
        const ReplyAppInactive(),
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
