import 'package:date_formatter/date_formatter.dart';
import 'package:equatable/equatable.dart';
import 'package:feed_repository/feed_repository.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:vote_repository/vote_repository.dart';
import 'package:web_links/web_links.dart';

class FeedItemModel extends Equatable {
  const FeedItemModel(
    FeedItem item, {
    DateFormatter? formatter,
    WebLinks? webLinks,
  }) : _item = item,
       _formatter = formatter ?? const DateFormatter(),
       _webLinks = webLinks ?? const WebLinks();

  final FeedItem _item;
  final DateFormatter _formatter;
  final WebLinks _webLinks;

  String get id => _item.id;
  String get title => _item.title;
  String get url => _item.url;
  String? get user => _item.hnuser?.id;
  String? get score => _item.score?.toString();
  String? get urlHost => _item.urlHost;
  String? get commentCount => _item.commentCount?.toString();
  String? get upvoteUrl => _item.upvoteUrl;
  bool get hasBeenUpvoted => _item.hasBeenUpvoted;

  String shareText(AppLocalizations l10n) {
    final title = _item.title;
    final resolvedUrl = _webLinks.resolve(_item.url);
    return l10n.feed_shareText(
      title: title,
      url: resolvedUrl,
    );
  }

  String age(DateFormatterLocalizations l10n) {
    return _formatter.format(l10n, _item.age);
  }

  String rank(AppLocalizations l10n) {
    return l10n.feed_rank(rank: _item.rank);
  }

  FeedItem toRepository() => _item;

  FeedItemModel vote(VoteType type) {
    return FeedItemModel(
      switch (type) {
        VoteType.upvote => _item.upvote(),
        VoteType.unvote => _item.unvote(),
      },
    );
  }

  @override
  List<Object> get props => [
    _item,
    _formatter,
  ];
}
