import 'package:flutter/material.dart';
import 'package:hacker_client/web_redirect/web_redirect.dart';

class WebRedirectBody extends StatelessWidget {
  const WebRedirectBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Stack(
        children: [
          WebRedirectWebView(),
          WebRedirectProgressIndicator(),
        ],
      ),
    );
  }
}
