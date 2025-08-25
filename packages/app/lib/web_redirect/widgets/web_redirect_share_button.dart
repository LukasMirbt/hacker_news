import 'package:app/web_redirect/web_redirect.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_launcher/share_launcher.dart';

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
        final state = context.read<WebRedirectBloc>().state;
        ShareLauncher().share(
          text: state.redirect.url.toString(),
        );
      },
    );
  }
}
