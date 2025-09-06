import 'package:app/app_web_view/app_web_view.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

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
