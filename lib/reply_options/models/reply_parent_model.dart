import 'package:app_client/app_client.dart';
import 'package:equatable/equatable.dart';
import 'package:reply_repository/reply_repository.dart';
import 'package:web_links/web_links.dart';

class ReplyParentModel extends Equatable {
  const ReplyParentModel(
    ReplyParent parent, {
    WebLinks? webLinks,
  }) : _parent = parent,
       _links = webLinks ?? const WebLinks();

  final ReplyParent _parent;
  final WebLinks _links;

  WebRedirect get webRedirect {
    final url = _links.commentUrl(_parent.id);
    return WebRedirect(url: url);
  }

  @override
  List<Object?> get props => [
    _parent,
    _links,
  ];
}
