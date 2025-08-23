import 'package:app/comment_list/comment_list.dart' hide Comment;
import 'package:collapse_handler/collapse_handler.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:post_repository/post_repository.dart';

class CommentListModel extends Equatable {
  CommentListModel({
    required this.items,
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

  CommentListModel rebuildWith(List<Comment> comments) {
    final updatedItems = _collapseHandler.rebuildWith(
      oldItems: items,
      newItems: [
        for (final comment in comments) CommentModel.from(comment),
      ],
    );

    return CommentListModel(items: updatedItems);
  }

  CommentListModel toggleExpansion({
    required CommentModel comment,
  }) {
    final updatedItems = _collapseHandler.toggleExpansion(
      items: items,
      itemToToggle: comment,
    );
    return CommentListModel(items: updatedItems);
  }

  @override
  List<Object> get props => [
    items,
    visibleItems,
  ];
}
