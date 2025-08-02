import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/reply/reply.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
                SizedBox(height: AppSpacing.xs),
                _Parent(),
                ReplyDivider(),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSpacing.xlg,
                    ),
                    child: _Body(),
                  ),
                ),
                SizedBox(height: AppSpacing.lg),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _Parent extends StatelessWidget {
  const _Parent();

  @override
  Widget build(BuildContext context) {
    final isFailure = context.select(
      (ReplyBloc bloc) => bloc.state.fetchStatus.isFailure,
    );

    final isLoading = context.select(
      (ReplyBloc bloc) => bloc.state.fetchStatus.isLoading,
    );

    final isPlaceholder = context.select(
      (ReplyBloc bloc) => bloc.state.isPlaceholder,
    );

    if (isFailure) return const ErrorText();

    return Skeletonizer(
      enabled: isLoading && isPlaceholder,
      child: const ReplyParent(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return const ReplyTextField();
  }
}
