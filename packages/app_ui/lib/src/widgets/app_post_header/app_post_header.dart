import 'package:app_ui/app_ui.dart';
import 'package:app_ui/src/widgets/app_post_header/action_row.dart';
import 'package:app_ui/src/widgets/app_post_header/content_row.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

export 'data.dart';

class AppPostHeader extends StatelessWidget {
  const AppPostHeader({
    required this.data,
    super.key,
  });

  final AppPostHeaderData data;

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: data,
      child: Column(
        children: [
          const SizedBox(height: AppSpacing.lg),
          const ContentRow(),
          if (data.htmlText != null)
            const Padding(
              padding: EdgeInsets.only(top: AppSpacing.lg),
              child: Divider(height: 1),
            )
          else
            const SizedBox(height: AppSpacing.xs),
          const ActionRow(),
          const Divider(height: 1),
        ],
      ),
    );
  }
}
