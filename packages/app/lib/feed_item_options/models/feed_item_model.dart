import 'package:app/external_links/external_links.dart';
import 'package:equatable/equatable.dart';
import 'package:feed_repository/feed_repository.dart';
import 'package:web_links/web_links.dart';

class FeedItemModel extends Equatable {
  const FeedItemModel(
    FeedItem item, {
    WebLinks? webLinks,
  }) : _item = item,
       _links = webLinks ?? const WebLinks();

  final FeedItem _item;
  final WebLinks _links;

  String get webUrl {
    final id = _item.id;
    return hackerNewsItemLink(id: id);
  }

  @override
  List<Object> get props => [
    _item,
    _links,
  ];
}
