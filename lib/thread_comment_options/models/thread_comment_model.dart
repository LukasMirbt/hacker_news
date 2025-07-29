import 'package:app_client/app_client.dart';
import 'package:equatable/equatable.dart';
import 'package:thread_repository/thread_repository.dart';
import 'package:web_links/web_links.dart';

class ThreadCommentModel extends Equatable {
  const ThreadCommentModel(
    ThreadComment comment, {
    WebLinks? webLinks,
  }) : _comment = comment,
       _links = webLinks ?? const WebLinks();

  final ThreadComment _comment;
  final WebLinks _links;

  String get id => _comment.id;
  String? get postId => _comment.postId;
  String? get replyUrl => _comment.replyUrl;
  String? get onTitle => _comment.onTitle;

  WebRedirect get webRedirect {
    final url = _links.commentUrl(_comment.id);
    return WebRedirect(url: url);
  }

  @override
  List<Object> get props => [
    _comment,
    _links,
  ];
}
