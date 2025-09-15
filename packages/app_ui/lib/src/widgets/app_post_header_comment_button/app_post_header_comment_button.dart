import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

export 'app_post_header_comment_button_data.dart';
export 'app_post_header_comment_button_data_placeholder.dart';

class AppPostHeaderCommentButton extends StatelessWidget {
  const AppPostHeaderCommentButton({
    required this.data,
    super.key,
  });

  final AppPostHeaderCommentButtonData data;

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: data,
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final isDisabled = context.select(
      (AppPostHeaderCommentButtonData data) => data.onPressed == null,
    );

    return TextButton(
      onPressed: isDisabled
          ? null
          : () {
              final data = context.read<AppPostHeaderCommentButtonData>();
              data.onPressed?.call();
            },
      child: const Row(
        spacing: AppSpacing.xs,
        children: [
          _Icon(),
          _Text(),
        ],
      ),
    );
  }
}

class _Icon extends StatelessWidget {
  const _Icon();

  @override
  Widget build(BuildContext context) {
    return const AppIcon(
      Symbols.chat_bubble,
      size: 18,
    );
  }
}

class _Text extends StatelessWidget {
  const _Text();

  @override
  Widget build(BuildContext context) {
    final commentCount = context.select(
      (AppPostHeaderCommentButtonData data) => data.commentCount,
    );

    return Text(
      commentCount,
      style: TextTheme.of(context).bodyMedium,
    );
  }
}
