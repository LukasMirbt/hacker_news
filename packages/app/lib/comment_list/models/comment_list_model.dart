// ignore_for_file: annotate_overrides

import 'package:app/comment_list/comment_list.dart' hide Comment;
import 'package:collapse_handler/collapse_handler.dart';
import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:post_repository/post_repository.dart';
import 'package:post_search_repository/post_search_repository.dart';

part 'comment_list_model.freezed.dart';

@freezed
class CommentListModel with _$CommentListModel {
  CommentListModel({
    required this.items,
    this.selectedComment,
    CollapseHandler<CommentModel>? collapseHandler,
  }) : _collapseHandler = collapseHandler ?? const CollapseHandler(),
       visibleItems = [
         for (final item in items)
           if (item.isParentExpanded) item,
       ];

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

  final List<CommentModel> visibleItems;
  final SelectedCommentModel? selectedComment;

  int? get selectedIndex => selectedComment?.index;

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
    return copyWith(items: updatedList);
  }

  CommentListModel insertAfter({
    required CommentModel afterItem,
    required CommentModel newItem,
  }) {
    final index = items.indexOf(afterItem);
    if (index == -1) return this;
    final updatedItems = [...items]..insert(index + 1, newItem);
    return copyWith(items: updatedItems);
  }

  CommentListModel rebuildWith({
    required List<Comment> comments,
  }) {
    final updatedItems = _collapseHandler.rebuildWith(
      oldItems: items,
      newItems: [
        for (final comment in comments) CommentModel.from(comment),
      ],
    );

    return copyWith(items: updatedItems);
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

    return copyWith(items: updatedItems);
  }

  CommentListModel updateSelection({
    required SelectedComment? comment,
  }) {
    SelectedCommentModel? selectedComment;
    var updatedItems = items;

    if (comment != null) {
      final index = items.indexWhere(
        (item) => item.id == comment.id,
      );

      updatedItems = _collapseHandler.ensureVisible(
        items: items,
        index: index,
      );

      selectedComment = SelectedCommentModel(
        id: comment.id,
        index: index,
      );
    }

    return copyWith(
      selectedComment: selectedComment,
      items: updatedItems,
    );
  }
}
