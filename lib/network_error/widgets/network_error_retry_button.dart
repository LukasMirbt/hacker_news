import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/network_error/network_error.dart';

class NetworkErrorRetryButton extends StatelessWidget {
  const NetworkErrorRetryButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoadingOrSuccess = context.select(
      (NetworkErrorBloc bloc) => bloc.state.isLoadingOrSuccess,
    );

    return AppFilledButton.expand(
      isLoading: isLoadingOrSuccess,
      onPressed: () {
        context.read<NetworkErrorBloc>().add(
          const NetworkErrorRetryPressed(),
        );
      },
      child: const Text('Retry'),
    );
  }
}
