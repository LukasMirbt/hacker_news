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
  String? get postId => _item.postId;
  String? get replyUrl => _item.replyUrl;
  String? get onTitle => _item.onTitle;

  WebRedirect get webRedirect {
    final url = _links.commentUrl(_item.id);
    return WebRedirect(url: url);
  }

  @override
  List<Object> get props => [
    _item,
    _links,
  ];
}
