import 'package:app/app_web_view/app_web_view.dart';
import 'package:flutter/material.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                AppWebView(),
                AppWebViewProgressIndicator(),
              ],
            ),
          ),
          AppWebViewActionBar(),
        ],
      ),
    );
  }
}
