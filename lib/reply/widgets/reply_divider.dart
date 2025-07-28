import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/reply/reply.dart';

class ReplyDivider extends StatelessWidget {
  const ReplyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final isExpanded = context.select(
      (ReplyBloc bloc) => bloc.state.parent.isExpanded,
    );

    return Padding(
      padding: EdgeInsets.only(
        top: isExpanded ? AppSpacing.lg : AppSpacing.xs,
        bottom: AppSpacing.lg,
      ),
      child: const Divider(height: 1),
    );
  }
}
