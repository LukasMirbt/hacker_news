import 'package:date_formatter/date_formatter.dart';
import 'package:equatable/equatable.dart';
import 'package:thread_repository/thread_repository.dart';

class ThreadCommentModel extends Equatable {
  const ThreadCommentModel({
    required this.repositoryItem,
    DateFormatter? formatter,
  }) : _formatter = formatter ?? const DateFormatter();

  final ThreadCommentData repositoryItem;
  final DateFormatter _formatter;

  String get htmlText => repositoryItem.htmlText;
  String get user => repositoryItem.hnuser.id;

  // TODO: Handle in UI
  bool get isNewUser => repositoryItem.hnuser.isNew;

  int? get score => repositoryItem.score;
  bool? get hasBeenUpvoted => repositoryItem.hasBeenUpvoted;
  String get id => repositoryItem.id;
  int get indent => repositoryItem.indent;

  bool get isTopLevel => repositoryItem.indent == 0;

  String get shareText =>
      'Check out this comment: https://news.ycombinator.com/item?id=${repositoryItem.id}';

  String age(DateFormatterLocalizations l10n) {
    return _formatter.format(l10n, repositoryItem.age);
  }

  @override
  List<Object> get props => [
    repositoryItem,
    _formatter,
  ];
}
