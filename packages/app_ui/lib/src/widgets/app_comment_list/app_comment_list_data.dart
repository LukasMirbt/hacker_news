import 'package:collapse_handler/collapse_handler.dart';
import 'package:flutter/widgets.dart';

typedef ItemBuilder = Widget Function(BuildContext, int);

typedef ListBuilder =
    Widget Function(
      BuildContext context,
      ItemBuilder itemBuilder,
    );

class AppCommentListData {
  const AppCommentListData({
    required this.items,
    required this.listBuilder,
    required this.commentBuilder,
    this.selectedIndex,
  });

  final List<Collapsible<dynamic>> items;
  final ListBuilder listBuilder;
  final ItemBuilder commentBuilder;
  final int? selectedIndex;

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
