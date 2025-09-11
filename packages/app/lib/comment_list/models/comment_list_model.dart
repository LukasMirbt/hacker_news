import 'package:app/comment_list/comment_list.dart' hide Comment;
import 'package:collapse_handler/collapse_handler.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:post_repository/post_repository.dart';

class CommentListModel extends Equatable {
  CommentListModel({
    required this.items,
    this.selectedComment,
    CollapseHandler<CommentModel>? collapseHandler,
  }) : _collapseHandler = collapseHandler ?? const CollapseHandler() {
    final visibleItems = <CommentModel>[];

    final selectedComment = this.selectedComment;

    int? selectedIndex;

    for (final item in items) {
      if (item.isParentExpanded) {
        if (selectedComment != null && item.id == selectedComment.comment.id) {
          selectedIndex = visibleItems.length;
        }

        visibleItems.add(item);
      }
    }

    this.visibleItems = visibleItems;
    this.selectedIndex = selectedIndex;
  }

  factory CommentListModel.from(List<Comment> items) {
    return CommentListModel(
      items: [
        for (final item in items) CommentModel.from(item),
      ],
    );
  }

  final CollapseHandler<CommentModel> _collapseHandler;

  @visibleForTesting
  final List<CommentModel> items;

  late final List<CommentModel> visibleItems;

  final SelectedComment? selectedComment;
  late final int? selectedIndex;

  CommentModel? findById(String id) {
    return items.firstWhereOrNull(
      (item) => item.id == id,
    );
  }

  CommentListModel update(CommentModel updatedItem) {
    final updatedList = [
      for (final item in items)
        if (item.id == updatedItem.id) updatedItem else item,
    ];
    return CommentListModel(items: updatedList);
  }

  CommentListModel insertAfter({
    required CommentModel afterItem,
    required CommentModel newItem,
  }) {
    final index = items.indexOf(afterItem);
    if (index == -1) return this;
    final updatedItems = [...items]..insert(index + 1, newItem);
    return CommentListModel(items: updatedItems);
  }

  CommentListModel updateWith({
    required List<Comment> comments,
    required SelectedComment? selectedComment,
  }) {
    var updatedItems = _collapseHandler.rebuildWith(
      oldItems: items,
      newItems: [
        for (final comment in comments) CommentModel.from(comment),
      ],
    );

    if (selectedComment != null) {
      final selectedIndex = updatedItems.indexWhere(
        (item) => item.id == selectedComment.comment.id,
      );

      updatedItems = _collapseHandler.ensureVisible(
        items: updatedItems,
        index: selectedIndex,
      );
    }

    return CommentListModel(
      items: updatedItems,
      selectedComment: selectedComment,
    );
  }

  CommentListModel toggleExpansion({
    required CommentModel comment,
  }) {
    final index = items.indexOf(comment);
    if (index == -1) return this;

    final updatedItems = _collapseHandler.toggleExpansion(
      items: items,
      index: index,
    );

    return CommentListModel(items: updatedItems);
  }

  @override
  List<Object?> get props => [
    items,
    selectedComment,
    visibleItems,
    _collapseHandler,
  ];
}
