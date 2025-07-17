import 'package:collapse_handler/collapse_handler.dart';
import 'package:date_formatter/date_formatter.dart';
import 'package:equatable/equatable.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:thread_repository/thread_repository.dart';
import 'package:vote_repository/vote_repository.dart';

class ThreadCommentModel extends Equatable
    implements Collapsible<ThreadCommentModel> {
  const ThreadCommentModel({
    required this.comment,
    this.isExpanded = true,
    this.isParentExpanded = true,
    DateFormatter formatter = const DateFormatter(),
  }) : _formatter = formatter;

  final DateFormatter _formatter;
  final ThreadComment comment;

  @override
  final bool isExpanded;

  @override
  final bool isParentExpanded;

  @override
  String get id => comment.id;

  @override
  int get indent => comment.indent;

  bool get hasBeenUpvoted => comment.hasBeenUpvoted ?? false;
  String get user => comment.hnuser.id;
  String get htmlText => comment.htmlText;

  bool get isTopLevel => comment.indent == 0;

  ThreadComment toRepository() => comment;

  String age(
    AppLocalizations appL10n,
    DateFormatterLocalizations formatterL10n,
  ) {
    final formattedAge = _formatter.format(formatterL10n, comment.age);
    final ageString = appL10n.commentList_age(age: formattedAge);
    return ageString;
  }

  ThreadCommentModel vote(VoteType type) {
    return copyWith(
      comment: switch (type) {
        VoteType.upvote => comment.upvote(),
        VoteType.unvote => comment.unvote(),
      },
    );
  }

  @override
  ThreadCommentModel copyWith({
    ThreadComment? comment,
    bool? isExpanded,
    bool? isParentExpanded,
  }) {
    return ThreadCommentModel(
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
