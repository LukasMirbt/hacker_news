import 'package:date_formatter/date_formatter.dart';
import 'package:equatable/equatable.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:reply_repository/reply_repository.dart';
import 'package:vote_repository/vote_repository.dart';

class ReplyParentModel extends Equatable {
  const ReplyParentModel({
    required ReplyParent parent,
    DateFormatter formatter = const DateFormatter(),
    this.isExpanded = true,
  }) : _parent = parent,
       _formatter = formatter;

  static final empty = ReplyParentModel(
    parent: ReplyParent.empty,
  );

  final ReplyParent _parent;
  final DateFormatter _formatter;
  final bool isExpanded;

  String get id => _parent.id;
  String get upvoteUrl => _parent.upvoteUrl;
  bool get hasBeenUpvoted => _parent.hasBeenUpvoted;
  String get user => _parent.hnuser.id;
  String get htmlText => _parent.htmlText;

  ReplyParent toRepository() => _parent;

  String age(
    AppLocalizations appL10n,
    DateFormatterLocalizations formatterL10n,
  ) {
    final formattedAge = _formatter.format(formatterL10n, _parent.age);
    final ageString = appL10n.reply_age(age: formattedAge);
    return ageString;
  }

  ReplyParentModel vote(VoteType type) {
    return copyWith(
      parent: switch (type) {
        VoteType.upvote => _parent.upvote(),
        VoteType.unvote => _parent.unvote(),
      },
    );
  }

  ReplyParentModel copyWith({
    ReplyParent? parent,
    DateFormatter? formatter,
    bool? isExpanded,
  }) {
    return ReplyParentModel(
      parent: parent ?? _parent,
      formatter: formatter ?? _formatter,
      isExpanded: isExpanded ?? this.isExpanded,
    );
  }

  @override
  List<Object?> get props => [
    _parent,
    _formatter,
    isExpanded,
  ];
}
