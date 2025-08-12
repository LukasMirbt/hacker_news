import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/web_redirect/web_redirect.dart';

class WebRedirectReloadButton extends StatelessWidget {
  const WebRedirectReloadButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const AppIcon(Symbols.refresh_rounded),
      onPressed: () {
        context.read<WebRedirectBloc>().add(
          const WebRedirectReloadPressed(),
        );
      },
    );
  }
}
