import 'package:app/app_web_view/app_web_view.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppWebViewForwardButton extends StatelessWidget {
  const AppWebViewForwardButton({super.key});

  @override
  Widget build(BuildContext context) {
    final canGoForward = context.select(
      (AppWebViewBloc bloc) => bloc.state.canGoForward,
    );

    return IconButton(
      icon: const AppIcon(Symbols.arrow_forward_rounded),
      onPressed: !canGoForward
          ? null
          : () {
              context.read<AppWebViewBloc>().add(
                const AppWebViewForwardPressed(),
              );
            },
    );
  }
}
