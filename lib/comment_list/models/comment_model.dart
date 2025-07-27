import 'package:collapse_handler/collapse_handler.dart';
import 'package:date_formatter/date_formatter.dart';
import 'package:equatable/equatable.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:post_repository/post_repository.dart';
import 'package:vote_repository/vote_repository.dart';

class CommentModel extends Equatable implements Collapsible<CommentModel> {
  const CommentModel({
    required Comment comment,
    this.isExpanded = true,
    this.isParentExpanded = true,
    DateFormatter formatter = const DateFormatter(),
  }) : _comment = comment,
       _formatter = formatter;

  final DateFormatter _formatter;
  final Comment _comment;

  @override
  final bool isExpanded;

  @override
  final bool isParentExpanded;

  @override
  String get id => _comment.id;

  @override
  int get indent => _comment.indent;

  String get upvoteUrl => _comment.upvoteUrl;
  bool get hasBeenUpvoted => _comment.hasBeenUpvoted;
  String get user => _comment.hnuser.id;
  String get htmlText => _comment.htmlText;

  bool get isTopLevel => _comment.indent == 0;

  Comment toRepository() => _comment;

  String age(
    AppLocalizations appL10n,
    DateFormatterLocalizations formatterL10n,
  ) {
    final formattedAge = _formatter.format(formatterL10n, _comment.age);
    final ageString = appL10n.commentList_age(age: formattedAge);
    return ageString;
  }

  CommentModel vote(VoteType type) {
    return copyWith(
      comment: switch (type) {
        VoteType.upvote => _comment.upvote(),
        VoteType.unvote => _comment.unvote(),
      },
    );
  }

  @override
  CommentModel copyWith({
    Comment? comment,
    bool? isExpanded,
    bool? isParentExpanded,
  }) {
    return CommentModel(
      comment: comment ?? _comment,
      formatter: _formatter,
      isExpanded: isExpanded ?? this.isExpanded,
      isParentExpanded: isParentExpanded ?? this.isParentExpanded,
    );
  }

  @override
  List<Object> get props => [
    _comment,
    _formatter,
    isExpanded,
    isParentExpanded,
  ];
}
