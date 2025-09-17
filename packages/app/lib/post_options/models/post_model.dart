import 'package:app_client/app_client.dart';
import 'package:equatable/equatable.dart';
import 'package:post_repository/post_repository.dart';
import 'package:web_links/web_links.dart';

class PostModel extends Equatable {
  const PostModel(
    Post post, {
    WebLinks? webLinks,
  }) : _post = post,
       _links = webLinks ?? const WebLinks();

  final Post _post;
  final WebLinks _links;

  String? get user => _post.header.hnuser?.id;
  String? get urlHost => _post.header.urlHost;

  WebRedirect get webRedirect {
    final url = _links.itemUrl(id: _post.header.id);
    return WebRedirect(url: url);
  }

  @override
  List<Object?> get props => [
    _post,
    _links,
  ];
}
