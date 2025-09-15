import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostHeaderOptionsButton extends StatelessWidget {
  const PostHeaderOptionsButton({super.key});

  @override
  Widget build(BuildContext context) {
    final optionsButton = context.select(
      (AppPostHeaderData data) => data.optionsButton,
    );

    if (optionsButton != null) return optionsButton;

    return const PostHeaderButtonPlaceholder();
  }
}
