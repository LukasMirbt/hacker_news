import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/network_error/network_error.dart';

class NetworkErrorView extends StatelessWidget {
  const NetworkErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    final from = GoRouterState.of(context).uri.queryParameters['from'];

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppSpacing.lg,
              horizontal: AppSpacing.xlg,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: AppSpacing.lg,
              children: [
                const Text('Network error'),
                Text('From: $from'),
                const NetworkErrorRetryButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
