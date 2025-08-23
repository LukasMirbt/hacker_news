import 'package:app/web_redirect/web_redirect.dart';
import 'package:flutter/material.dart';

class WebRedirectActionBar extends StatelessWidget {
  const WebRedirectActionBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
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
