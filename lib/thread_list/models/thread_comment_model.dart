import 'package:date_formatter/date_formatter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:thread_repository/thread_repository.dart';
import 'package:vote_repository/vote_repository.dart';

part 'thread_comment_model.freezed.dart';

@freezed
abstract class ThreadCommentModel with _$ThreadCommentModel {
  const factory ThreadCommentModel({
    required ThreadComment comment,
    @Default(true) bool isExpanded,
    @Default(true) bool isParentExpanded,
    @Default(DateFormatter()) DateFormatter formatter,
  }) = _ThreadCommentModel;

  const ThreadCommentModel._();

  String get id => comment.id;
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
    final formattedAge = formatter.format(formatterL10n, comment.age);
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
}
