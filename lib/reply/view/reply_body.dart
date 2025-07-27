import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:hacker_client/reply/reply.dart';

class ReplyBody extends StatelessWidget {
  const ReplyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReplyParent(),
                Divider(height: 1),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSpacing.xlg,
                      vertical: AppSpacing.lg,
                    ),
                    child: ReplyTextField(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
