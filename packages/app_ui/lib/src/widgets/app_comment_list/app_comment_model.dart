import 'package:app_ui/app_ui.dart';
import 'package:collapse_handler/collapse_handler.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AppCommentModel extends Equatable {
  const AppCommentModel(this._comment);

  final Collapsible<dynamic> _comment;

  bool get isExpanded => _comment.isExpanded;

  double get indentPadding => _comment.indent * AppSpacing.md;

  double get threadBottomPadding {
    if (_comment.isExpanded) return AppSpacing.sm;
    return AppSpacing.xs;
  }

  Color? backgroundColor({
    required ExtendedColorScheme colorScheme,
    required bool isSelected,
  }) {
    if (isSelected) return colorScheme.highlight;
    return null;
  }

  @override
  List<Object> get props => [_comment];
}
