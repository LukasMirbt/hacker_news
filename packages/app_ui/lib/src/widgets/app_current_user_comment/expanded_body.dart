import 'package:app_ui/app_ui.dart';
import 'package:app_ui/src/widgets/app_current_user_comment/app_current_user_comment.dart';
import 'package:flutter/material.dart';

class ExpandedBody extends StatelessWidget {
  const ExpandedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderRow(),
        _Html(),
      ],
    );
  }
}

class _Html extends StatelessWidget {
  const _Html();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        left: AppSpacing.xlg,
        right: AppSpacing.xlg,
      ),
      child: Html(),
    );
  }
}
