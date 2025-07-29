import 'package:collapse_handler/collapse_handler.dart';
import 'package:date_formatter/date_formatter.dart';
import 'package:equatable/equatable.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:thread_repository/thread_repository.dart';
import 'package:vote_repository/vote_repository.dart';

class ThreadCommentModel extends Equatable
    implements Collapsible<ThreadCommentModel> {
  const ThreadCommentModel({
    required this.item,
    this.isExpanded = true,
    this.isParentExpanded = true,
    DateFormatter? formatter,
  }) : _formatter = formatter ?? const DateFormatter();

  final DateFormatter _formatter;
  final ThreadComment item;

  @override
  final bool isExpanded;

  @override
  final bool isParentExpanded;

  @override
  String get id => item.id;

  @override
  int get indent => item.indent;

  String? get upvoteUrl => item.upvoteUrl;
  bool get hasBeenUpvoted => item.hasBeenUpvoted ?? false;
  String get user => item.hnuser.id;
  String get htmlText => item.htmlText;
  bool get isTopLevel => item.indent == 0;

  ThreadComment toRepository() => item;

  String age(
    AppLocalizations appL10n,
    DateFormatterLocalizations formatterL10n,
  ) {
    final formattedAge = _formatter.format(formatterL10n, item.age);
    final ageString = appL10n.threadFeed_age(age: formattedAge);
    return ageString;
  }

  ThreadCommentModel vote(VoteType type) {
    return copyWith(
      item: switch (type) {
        VoteType.upvote => item.upvote(),
        VoteType.unvote => item.unvote(),
      },
    );
  }

  @override
  ThreadCommentModel copyWith({
    ThreadComment? item,
    bool? isExpanded,
    bool? isParentExpanded,
  }) {
    return ThreadCommentModel(
      formatter: _formatter,
      item: item ?? this.item,
      isExpanded: isExpanded ?? this.isExpanded,
      isParentExpanded: isParentExpanded ?? this.isParentExpanded,
    );
  }

  @override
  List<Object?> get props => [
    _formatter,
    item,
    isExpanded,
    isParentExpanded,
  ];
}
