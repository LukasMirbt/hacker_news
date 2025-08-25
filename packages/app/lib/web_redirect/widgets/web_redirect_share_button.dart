import 'package:app/web_redirect/web_redirect.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WebRedirectShareButton extends StatelessWidget {
  const WebRedirectShareButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const AppIcon(
        Symbols.share_rounded,
        size: 20,
      ),
      onPressed: () {
        context.read<WebRedirectBloc>().add(
          const WebRedirectSharePressed(),
        );
      },
    );
  }
}
