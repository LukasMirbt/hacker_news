import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/comment_list/comment_list.dart';
import 'package:hacker_client/post/post.dart';
import 'package:hacker_client/post_header/post_header.dart';

class PostBody extends StatelessWidget {
  const PostBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ScrollController>();

    final appBarHeight = const PostAppBar().preferredSize.height;

    return CustomScrollView(
      controller: controller,
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: EdgeInsets.only(top: appBarHeight),
        ),
        const SliverToBoxAdapter(
          child: PostHeader(),
        ),
        const SliverToBoxAdapter(
          child: Divider(height: 1),
        ),
        const SliverPadding(
          padding: EdgeInsets.only(bottom: AppSpacing.xs),
        ),
        const CommentSliverList(),
      ],
    );
  }
}
