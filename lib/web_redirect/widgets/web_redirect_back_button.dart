import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/web_redirect/web_redirect.dart';

class WebRedirectBackButton extends StatelessWidget {
  const WebRedirectBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    final canGoBack = context.select(
      (WebRedirectBloc bloc) => bloc.state.canGoBack,
    );

    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: !canGoBack
          ? null
          : () {
              context.read<WebRedirectBloc>().add(
                const WebRedirectBackPressed(),
              );
            },
    );
  }
}
