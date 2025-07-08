import 'package:app_ui/app_ui.dart';
import 'package:app_ui/src/widgets/app_comment/header_row.dart';
import 'package:app_ui/src/widgets/app_comment/html_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

export 'data.dart';

class AppComment extends StatelessWidget {
  const AppComment({
    required this.data,
    super.key,
  });

  final AppCommentData data;

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: data,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderRow(),
          if (data.isExpanded)
            const Padding(
              padding: EdgeInsets.only(
                left: AppSpacing.xlg,
                right: AppSpacing.xlg,
              ),
              child: HtmlText(),
            ),
        ],
      ),
    );
  }
}
