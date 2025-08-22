import 'package:app/web_redirect/web_redirect.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WebRedirectView extends StatelessWidget {
  const WebRedirectView({super.key});

  @override
  Widget build(BuildContext context) {
    return const WebRedirectPopScope(
      child: Scaffold(
        body: _Body(),
        bottomNavigationBar: WebRedirectActionBar(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select(
      (WebRedirectBloc bloc) => bloc.state.initialLoadStatus.isLoading,
    );

    if (isLoading) return const AppLoadingBody();

    return const WebRedirectBody();
  }
}
