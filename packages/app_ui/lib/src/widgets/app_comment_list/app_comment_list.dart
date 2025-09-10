import 'package:app_ui/src/widgets/app_comment_list/app_comment_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

export 'app_comment_list_data.dart';
export 'app_comment_model.dart';
export 'comment_background.dart';
export 'comment_indent.dart';
export 'comment_list_divider.dart';
export 'comment_list_footer.dart';
export 'comment_list_item.dart';
export 'comment_padding.dart';
export 'thread_bottom_padding.dart';
export 'thread_top_padding.dart';

class AppCommentList extends StatelessWidget {
  const AppCommentList({
    required this.data,
    super.key,
  });

  final AppCommentListData data;

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: data,
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final listController = context.select(
      (AppCommentListData data) => data.listController,
    );

    final itemCount = context.select(
      (AppCommentListData data) => data.items.length,
    );

    return SuperSliverList.builder(
      listController: listController,
      itemCount: itemCount,
      itemBuilder: (_, index) {
        return Provider.value(
          value: index,
          child: const _CommentListItem(),
        );
      },
    );
  }
}

class _CommentListItem extends StatelessWidget {
  const _CommentListItem();

  @override
  Widget build(BuildContext context) {
    final index = context.watch<int>();

    final comment = context.select(
      (AppCommentListData data) => data.items.elementAtOrNull(index),
    );

    if (comment == null) return const SizedBox.shrink();

    return Provider.value(
      value: AppCommentModel(comment),
      child: const _Item(),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CommentListItem(),
        CommentListDivider(),
        CommentListFooter(),
      ],
    );
  }
}
