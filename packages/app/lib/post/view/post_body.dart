import 'package:app/comment_list/comment_list.dart';
import 'package:app/post_header/post_header.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostBody extends StatefulWidget {
  const PostBody({super.key});

  @override
  State<PostBody> createState() => _PostBodyState();
}

class _PostBodyState extends State<PostBody> {
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
      child: CustomScrollView(
        controller: _controller,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: const [
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
      ),
    );
  }
}
