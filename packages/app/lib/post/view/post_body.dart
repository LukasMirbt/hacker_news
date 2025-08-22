import 'package:app/comment_list/comment_list.dart';
import 'package:app/post_header/post_header.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class PostBody extends StatelessWidget {
  const PostBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: PostHeader(),
        ),
        SliverToBoxAdapter(
          child: Divider(height: 1),
        ),
        SliverPadding(
          padding: EdgeInsets.only(bottom: AppSpacing.xs),
        ),
        CommentSliverList(),
      ],
    );
  }
}
