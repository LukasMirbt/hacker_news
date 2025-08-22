import 'package:app/post/post.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PostView extends StatelessWidget {
  const PostView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PostAppBar(),
      body: PostRefreshIndicator(
        child: _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select(
      (PostBloc bloc) => bloc.state.fetchStatus.isLoading,
    );

    final isFailure = context.select(
      (PostBloc bloc) => bloc.state.fetchStatus.isFailure,
    );

    if (isFailure) {
      return const AlwaysScrollable(
        child: AppErrorBody(),
      );
    }

    return Skeletonizer(
      enabled: isLoading,
      child: const PostBody(),
    );
  }
}
