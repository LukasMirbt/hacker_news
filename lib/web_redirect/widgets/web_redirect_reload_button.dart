import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/web_redirect/web_redirect.dart';

class WebRedirectReloadButton extends StatelessWidget {
  const WebRedirectReloadButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.refresh),
      onPressed: () {
        context.read<WebRedirectBloc>().add(
          const WebRedirectReloadPressed(),
        );
      },
    );
  }
}
