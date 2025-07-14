import 'package:app_ui/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class FeedItemButtonPlaceholder extends StatelessWidget {
  const FeedItemButtonPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    final textButtonTheme = TextButtonTheme.of(context);
    final size = textButtonTheme.style?.minimumSize?.resolve({});

    return InvisiblePlaceholder(
      visible: false,
      child: SizedBox.fromSize(size: size),
    );
  }
}
