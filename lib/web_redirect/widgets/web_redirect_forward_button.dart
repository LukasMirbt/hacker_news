import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/web_redirect/web_redirect.dart';

class WebRedirectForwardButton extends StatelessWidget {
  const WebRedirectForwardButton({super.key});

  @override
  Widget build(BuildContext context) {
    final canGoForward = context.select(
      (WebRedirectBloc bloc) => bloc.state.canGoForward,
    );

    return IconButton(
      icon: const Icon(Icons.arrow_forward),
      onPressed: !canGoForward
          ? null
          : () {
              context.read<WebRedirectBloc>().add(
                const WebRedirectForwardPressed(),
              );
            },
    );
  }
}
