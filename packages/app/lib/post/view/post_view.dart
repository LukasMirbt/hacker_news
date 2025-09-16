import 'package:app/post/post.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  late final ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableProvider.value(
      value: _controller,
      child: const Scaffold(
        appBar: PostAppBar(),
        body: PostRefreshIndicator(
          child: _Body(),
        ),
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
