import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:hacker_client/comment_list/comment_list.dart';
import 'package:hacker_client/post_header/post_header.dart';

class PostBody extends StatelessWidget {
  const PostBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: EdgeInsets.only(bottom: AppSpacing.xs),
          sliver: SliverToBoxAdapter(
            child: PostHeader(),
          ),
        ),
        CommentSliverList(),
      ],
    );
  }
}
