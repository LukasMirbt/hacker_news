import 'package:app/external_links/external_links.dart';
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

  String get webUrl {
    final id = _parent.id;
    return hackerNewsItemLink(id: id);
  }

  @override
  List<Object?> get props => [
    _parent,
    _links,
  ];
}
