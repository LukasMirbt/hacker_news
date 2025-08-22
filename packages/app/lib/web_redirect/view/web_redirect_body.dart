import 'package:app/web_redirect/web_redirect.dart';
import 'package:flutter/material.dart';

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
