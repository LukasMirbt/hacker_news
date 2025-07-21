import 'package:app_client/app_client.dart';
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

  String get id => _comment.id;

  WebRedirect get webRedirect {
    final url = _links.commentUrl(_comment.id);
    return WebRedirect(url: url);
  }

  String? get replyUrl => _comment.replyUrl;

  @override
  List<Object?> get props => [
    _comment,
    _links,
  ];
}
