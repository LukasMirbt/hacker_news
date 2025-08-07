import 'package:date_formatter/date_formatter.dart';
import 'package:equatable/equatable.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:reply_repository/reply_repository.dart';
import 'package:vote_repository/vote_repository.dart';

part 'current_user_reply_parent_model.dart';
part 'other_user_reply_parent_model.dart';

sealed class ReplyParentModel extends Equatable {
  const ReplyParentModel({
    this.isExpanded = true,
    DateFormatter formatter = const DateFormatter(),
  }) : _formatter = formatter;

  factory ReplyParentModel.from(ReplyParent parent) {
    return switch (parent) {
      OtherUserReplyParent() => OtherUserReplyParentModel(parent: parent),
      CurrentUserReplyParent() => CurrentUserReplyParentModel(parent: parent),
    };
  }

  final DateFormatter _formatter;
  final bool isExpanded;

  ReplyParent get _parent;

  String get id => _parent.id;
  String get user => _parent.hnuser.id;
  String get htmlText => _parent.htmlText;

  String age(
    AppLocalizations appL10n,
    DateFormatterLocalizations formatterL10n,
  ) {
    final formattedAge = _formatter.format(formatterL10n, _parent.age);
    final ageString = appL10n.reply_age(age: formattedAge);
    return ageString;
  }

  ReplyParent toRepository() => _parent;

  ReplyParentModel toggleExpansion() {
    return copyWith(
      isExpanded: !isExpanded,
    );
  }

  ReplyParentModel copyWith({
    bool? isExpanded,
  });

  @override
  List<Object> get props => [
    _formatter,
    isExpanded,
  ];
}
