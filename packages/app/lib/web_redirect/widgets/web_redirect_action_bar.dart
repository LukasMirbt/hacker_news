import 'package:app/web_redirect/web_redirect.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

// TODO: Icon theme

class WebRedirectActionBar extends StatelessWidget {
  const WebRedirectActionBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WebRedirectBackButton(),
            WebRedirectForwardButton(),
            WebRedirectReloadButton(),
            WebRedirectCloseButton(),
          ],
        ),
      ),
    );
  }
}
