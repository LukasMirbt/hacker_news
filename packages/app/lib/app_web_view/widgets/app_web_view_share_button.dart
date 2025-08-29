import 'package:app/app_web_view/app_web_view.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppWebViewShareButton extends StatelessWidget {
  const AppWebViewShareButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const AppIcon(
        Symbols.share_rounded,
        size: 20,
      ),
      onPressed: () {
        context.read<AppWebViewBloc>().add(
          const AppWebViewSharePressed(),
        );
      },
    );
  }
}
