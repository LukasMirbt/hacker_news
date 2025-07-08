import 'package:date_formatter/date_formatter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:post_repository/post_repository.dart';
import 'package:vote_repository/vote_repository.dart';

part 'comment_model.freezed.dart';

@freezed
abstract class CommentModel with _$CommentModel {
  const factory CommentModel({
    required Comment comment,
    @Default(true) bool isExpanded,
    @Default(true) bool isParentExpanded,
    @Default(DateFormatter()) DateFormatter formatter,
  }) = _CommentModel;

  const CommentModel._();

  String get id => comment.id;
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
    final formattedAge = formatter.format(formatterL10n, comment.age);
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
}
