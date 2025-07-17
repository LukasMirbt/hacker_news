import 'package:collapsible_list/collapsible_list.dart';
import 'package:date_formatter/date_formatter.dart';
import 'package:equatable/equatable.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:post_repository/post_repository.dart';
import 'package:vote_repository/vote_repository.dart';

class CommentModel extends Collapsible<CommentModel> with EquatableMixin {
  const CommentModel({
    required this.comment,
    this.isExpanded = true,
    this.isParentExpanded = true,
    DateFormatter formatter = const DateFormatter(),
  }) : _formatter = formatter;

  final DateFormatter _formatter;
  final Comment comment;

  @override
  final bool isExpanded;

  @override
  final bool isParentExpanded;

  @override
  String get id => comment.id;

  @override
  int get indent => comment.indent;

  String get upvoteUrl => comment.upvoteUrl;
  bool get hasBeenUpvoted => comment.hasBeenUpvoted;
  String get user => comment.hnuser.id;
  String get htmlText => comment.htmlText;

  bool get isTopLevel => comment.indent == 0;

  Comment toRepository() => comment;

  String age(
    AppLocalizations appL10n,
    DateFormatterLocalizations formatterL10n,
  ) {
    final formattedAge = _formatter.format(formatterL10n, comment.age);
    final ageString = appL10n.commentList_age(age: formattedAge);
    return ageString;
  }

  CommentModel vote(VoteType type) {
    return copyWith(
      comment: switch (type) {
        VoteType.upvote => comment.upvote(),
        VoteType.unvote => comment.unvote(),
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
      formatter: _formatter,
      comment: comment ?? this.comment,
      isExpanded: isExpanded ?? this.isExpanded,
      isParentExpanded: isParentExpanded ?? this.isParentExpanded,
    );
  }

  @override
  List<Object> get props => [
    _formatter,
    comment,
    isExpanded,
    isParentExpanded,
  ];
}
