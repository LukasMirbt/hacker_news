import 'package:app/web_redirect/web_redirect.dart';
import 'package:flutter/material.dart';

class WebRedirectToolbar extends StatelessWidget {
  const WebRedirectToolbar({super.key});

  @override
  Widget build(BuildContext context) {
    return const BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          WebRedirectBackButton(),
          WebRedirectForwardButton(),
          WebRedirectShareButton(),
          WebRedirectCloseButton(),
        ],
      ),
    );
  }
}
