import 'package:app/app_web_view/app_web_view.dart';
import 'package:flutter/material.dart';

class WebRedirectBody extends StatelessWidget {
  const WebRedirectBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Stack(
        children: [
          AppWebView(),
          AppWebViewProgressIndicator(),
        ],
      ),
    );
  }
}
