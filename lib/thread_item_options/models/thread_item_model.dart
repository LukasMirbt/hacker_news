import 'package:app_client/app_client.dart';
import 'package:equatable/equatable.dart';
import 'package:thread_repository/thread_repository.dart';
import 'package:web_links/web_links.dart';

class ThreadItemModel extends Equatable {
  const ThreadItemModel(
    ThreadFeedItem item, {
    WebLinks? webLinks,
  }) : _item = item,
       _links = webLinks ?? const WebLinks();

  final ThreadFeedItem _item;
  final WebLinks _links;

  String get id => _item.id;

  WebRedirect get webRedirect {
    final url = _links.feedItemUrl(_item.id);
    return WebRedirect(url: url);
  }

  String? get postId {
    final onUrl = _item.onUrl;
    if (onUrl == null) return null;
    final url = Uri.parse(onUrl);
    return url.queryParameters['id'];
  }

  String? get replyUrl => _item.replyUrl;

  @override
  List<Object> get props => [
    _item,
    _links,
  ];
}
