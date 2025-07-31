import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/network_error/network_error.dart';

class NetworkErrorSuccessListener extends StatelessWidget {
  const NetworkErrorSuccessListener({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<NetworkErrorBloc, NetworkErrorState>(
      listenWhen: (previous, current) =>
          !previous.status.isSuccess && current.status.isSuccess,
      listener: (context, state) {
        print('from: ${state.from}');
        GoRouter.of(context).go(state.from);
      },
      child: child,
    );
  }
}
