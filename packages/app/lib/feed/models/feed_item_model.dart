import 'package:app/l10n/l10n.dart';
import 'package:date_formatter/date_formatter.dart';
import 'package:equatable/equatable.dart';
import 'package:feed_repository/feed_repository.dart';
import 'package:vote_repository/vote_repository.dart';
import 'package:web_links/web_links.dart';

part 'job_feed_item_model.dart';
part 'post_feed_item_model.dart';

sealed class FeedItemModel extends Equatable {
  const FeedItemModel({
    DateFormatter? formatter,
  }) : _formatter = formatter ?? const DateFormatter();

  factory FeedItemModel.from(FeedItem item) {
    return switch (item) {
      PostFeedItem() => PostFeedItemModel(item),
      JobFeedItem() => JobFeedItemModel(item),
    };
  }

  final DateFormatter _formatter;

  FeedItem get _item;

  String get id => _item.id;
  String get title => _item.title;
  String get url => _item.url;
  String? get urlHost => _item.urlHost;

  String shareText(AppLocalizations l10);

  String age(DateFormatterLocalizations l10n) {
    return _formatter.format(l10n, _item.age);
  }

  String rank(AppLocalizations l10n) {
    return l10n.feed_rank(rank: _item.rank);
  }

  FeedItem toRepository() => _item;

  @override
  List<Object> get props => [_formatter];
}
