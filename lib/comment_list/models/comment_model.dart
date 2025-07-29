import 'package:collapse_handler/collapse_handler.dart';
import 'package:date_formatter/date_formatter.dart';
import 'package:equatable/equatable.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:post_repository/post_repository.dart';
import 'package:vote_repository/vote_repository.dart';

part 'current_user_comment_model.dart';
part 'other_user_comment_model.dart';

sealed class CommentModel extends Equatable
    implements Collapsible<CommentModel> {
  const CommentModel({
    this.isExpanded = true,
    this.isParentExpanded = true,
    DateFormatter formatter = const DateFormatter(),
  }) : _formatter = formatter;

  factory CommentModel.from(Comment comment) {
    return switch (comment) {
      OtherUserComment() => OtherUserCommentModel(comment: comment),
      CurrentUserComment() => CurrentUserCommentModel(comment: comment),
    };
  }

  final DateFormatter _formatter;

  Comment get _comment;

  @override
  final bool isExpanded;

  @override
  final bool isParentExpanded;

  @override
  String get id => _comment.id;

  @override
  int get indent => _comment.indent;

  String get user => _comment.hnuser.id;
  String get htmlText => _comment.htmlText;
  bool get isTopLevel => _comment.indent == 0;

  String age(
    AppLocalizations appL10n,
    DateFormatterLocalizations formatterL10n,
  ) {
    final formattedAge = _formatter.format(formatterL10n, _comment.age);
    final ageString = appL10n.commentList_age(age: formattedAge);
    return ageString;
  }

  @override
  List<Object> get props => [
    _formatter,
    isExpanded,
    isParentExpanded,
  ];
}
