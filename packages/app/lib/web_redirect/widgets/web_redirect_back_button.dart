import 'package:app/web_redirect/web_redirect.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WebRedirectBackButton extends StatelessWidget {
  const WebRedirectBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    final canGoBack = context.select(
      (WebRedirectBloc bloc) => bloc.state.canGoBack,
    );

    return IconButton(
      icon: const AppIcon(Symbols.arrow_back_rounded),
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
