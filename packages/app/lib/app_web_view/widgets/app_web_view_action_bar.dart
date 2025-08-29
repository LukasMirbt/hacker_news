import 'package:app/app_web_view/app_web_view.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

// TODO(LukasMirbt): Fix icon theme for dark mode

class AppWebViewActionBar extends StatelessWidget {
  const AppWebViewActionBar({super.key});

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
            AppWebViewBackButton(),
            AppWebViewForwardButton(),
            AppWebViewReloadButton(),
            AppWebViewShareButton(),
          ],
        ),
      ),
    );
  }
}
