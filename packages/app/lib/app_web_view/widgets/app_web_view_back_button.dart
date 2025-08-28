import 'package:app/app_web_view/app_web_view.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppWebViewBackButton extends StatelessWidget {
  const AppWebViewBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    final canGoBack = context.select(
      (AppWebViewBloc bloc) => bloc.state.canGoBack,
    );

    return IconButton(
      icon: const AppIcon(Symbols.arrow_back_rounded),
      onPressed: !canGoBack
          ? null
          : () {
              context.read<AppWebViewBloc>().add(
                const AppWebViewBackPressed(),
              );
            },
    );
  }
}
