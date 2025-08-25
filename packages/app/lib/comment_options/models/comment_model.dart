import 'package:app/external_links/external_links.dart';
import 'package:equatable/equatable.dart';
import 'package:post_repository/post_repository.dart';
import 'package:web_links/web_links.dart';

class CommentModel extends Equatable {
  const CommentModel(
    Comment comment, {
    WebLinks? webLinks,
  }) : _comment = comment,
       _links = webLinks ?? const WebLinks();

  final Comment _comment;
  final WebLinks _links;

  String? get replyUrl => _comment.replyUrl;

  String get webUrl {
    final id = _comment.id;
    return hackerNewsItemLink(id: id);
  }

  @override
  List<Object?> get props => [
    _comment,
    _links,
  ];
}
