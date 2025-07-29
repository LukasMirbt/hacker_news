import 'package:app_ui/src/widgets/app_current_user_comment/app_current_user_comment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeaderRow extends StatelessWidget {
  const HeaderRow({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Theme(
      data: theme.copyWith(
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            minimumSize: const Size(44, 44),
            foregroundColor: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ),
      child: const _Row(),
    );
  }
}

class _Row extends StatelessWidget {
  const _Row();

  @override
  Widget build(BuildContext context) {
    final onHeaderPressed = context.select(
      (AppCurrentUserCommentData data) => data.onHeaderPressed,
    );

    return InkWell(
      onTap: onHeaderPressed,
      child: const Padding(
        padding: EdgeInsets.only(left: 24, right: 4),
        child: Row(
          children: [
            Expanded(
              child: HeaderText(),
            ),
            MoreButton(),
          ],
        ),
      ),
    );
  }
}
