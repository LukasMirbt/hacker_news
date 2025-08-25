import 'package:date_formatter/date_formatter.dart';
import 'package:equatable/equatable.dart';
import 'package:post_repository/post_repository.dart';
import 'package:vote_repository/vote_repository.dart';

class PostHeaderModel extends Equatable {
  const PostHeaderModel(
    PostHeader header, {
    DateFormatter? formatter,
  }) : _header = header,
       _formatter = formatter ?? const DateFormatter();

  final PostHeader _header;
  final DateFormatter _formatter;

  String get id => _header.id;
  String get title => _header.title;
  String get url => _header.url;
  String? get user => _header.hnuser?.id;
  String? get score => _header.score?.toString();
  String? get urlHost => _header.urlHost;
  String? get commentCount => _header.commentCount?.toString();
  String? get htmlText => _header.htmlText;
  bool get hasBeenUpvoted => _header.hasBeenUpvoted;
  String? get upvoteUrl => _header.upvoteUrl;
  bool get isCommentingEnabled => _header.commentForm != null;

  String age(DateFormatterLocalizations l10n) {
    return _formatter.format(l10n, _header.age);
  }

  PostHeader toRepository() => _header;

  PostHeaderModel vote(VoteType type) {
    return PostHeaderModel(
      switch (type) {
        VoteType.upvote => _header.upvote(),
        VoteType.unvote => _header.unvote(),
      },
    );
  }

  @override
  List<Object?> get props => [
    _header,
    _formatter,
  ];
}
