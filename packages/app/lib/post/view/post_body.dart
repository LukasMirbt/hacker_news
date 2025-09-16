import 'package:app/comment_list/comment_list.dart';
import 'package:app/post_header/post_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostBody extends StatefulWidget {
  const PostBody({super.key});

  @override
  State<PostBody> createState() => _PostBodyState();
}

class _PostBodyState extends State<PostBody> {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ScrollController>();

    return CustomScrollView(
      controller: controller,
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: const [
        SliverToBoxAdapter(
          child: PostHeader(),
        ),
        SliverToBoxAdapter(
          child: Divider(height: 1),
        ),
        CommentSliverList(),
      ],
    );
  }
}
