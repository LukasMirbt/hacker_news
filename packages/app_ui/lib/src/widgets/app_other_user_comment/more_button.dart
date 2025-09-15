import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoreButton extends StatelessWidget {
  const MoreButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        final data = context.read<AppOtherUserCommentData>();
        data.onMorePressed();
      },
      icon: const AppIcon(
        Symbols.more_vert_rounded,
        size: 18,
      ),
    );
  }
}
