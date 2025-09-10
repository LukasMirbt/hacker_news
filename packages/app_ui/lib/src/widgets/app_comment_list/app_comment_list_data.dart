import 'package:collapse_handler/collapse_handler.dart';
import 'package:flutter/widgets.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

class AppCommentListData {
  const AppCommentListData({
    required this.listController,
    required this.selectedIndex,
    required this.items,
    required this.commentBuilder,
  });

  final ListController listController;
  final int? selectedIndex;
  final List<Collapsible<dynamic>> items;
  final Widget Function(BuildContext, int) commentBuilder;

  bool isSelected(int index) => selectedIndex == index;

  bool isStartOfThread(int index) {
    final comment = items.elementAtOrNull(index);
    if (comment == null) return false;
    return comment.indent == 0;
  }

  bool isEndOfThread(int index) {
    final nextComment = items.elementAtOrNull(index + 1);
    if (nextComment == null) return true;
    return nextComment.indent == 0;
  }

  bool isEndOfList(int index) {
    return index == items.length - 1;
  }
}
