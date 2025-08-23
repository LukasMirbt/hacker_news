import 'package:app/l10n/l10n.dart';
import 'package:collapse_handler/collapse_handler.dart';
import 'package:date_formatter/date_formatter.dart';
import 'package:equatable/equatable.dart';
import 'package:thread_repository/thread_repository.dart';
import 'package:vote_repository/vote_repository.dart';

part 'current_user_thread_comment_model.dart';
part 'other_user_thread_comment_model.dart';

sealed class ThreadCommentModel extends Equatable
    implements Collapsible<ThreadCommentModel> {
  const ThreadCommentModel({
    this.isExpanded = true,
    this.isParentExpanded = true,
    DateFormatter formatter = const DateFormatter(),
  }) : _formatter = formatter;

  factory ThreadCommentModel.from(ThreadComment comment) {
    return switch (comment) {
      OtherUserThreadComment() => OtherUserThreadCommentModel(
        comment: comment,
      ),
      CurrentUserThreadComment() => CurrentUserThreadCommentModel(
        comment: comment,
      ),
    };
  }

  final DateFormatter _formatter;

  ThreadComment get _comment;

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
    final ageString = appL10n.threadFeed_age(age: formattedAge);
    return ageString;
  }

  @override
  List<Object> get props => [
    _formatter,
    isExpanded,
    isParentExpanded,
  ];
}
