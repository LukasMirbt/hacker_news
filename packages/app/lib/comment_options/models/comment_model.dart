import 'package:app_client/app_client.dart';
import 'package:equatable/equatable.dart';
import 'package:post_repository/post_repository.dart';
import 'package:web_links/web_links.dart';

part 'current_user_comment_model.dart';
part 'other_user_comment_model.dart';

sealed class CommentModel extends Equatable {
  const CommentModel({
    WebLinks? webLinks,
  }) : _links = webLinks ?? const WebLinks();

  factory CommentModel.from(Comment comment) {
    return switch (comment) {
      OtherUserComment() => OtherUserCommentModel(comment),
      CurrentUserComment() => CurrentUserCommentModel(comment),
    };
  }

  final WebLinks _links;

  Comment get _comment;

  String? get replyUrl => _comment.replyUrl;

  WebRedirect get webRedirect {
    final url = _links.commentUrl(_comment.id);
    return WebRedirect(url: url);
  }

  String get shareText {
    final url = _links.commentUrl(_comment.id);
    return url.toString();
  }

  @override
  List<Object> get props => [_links];
}
