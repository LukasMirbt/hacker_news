import 'package:app_client/app_client.dart';
import 'package:equatable/equatable.dart';
import 'package:thread_repository/thread_repository.dart';
import 'package:web_links/web_links.dart';

part 'current_user_thread_comment_model.dart';
part 'other_user_thread_comment_model.dart';

sealed class ThreadCommentModel extends Equatable {
  const ThreadCommentModel({
    WebLinks? webLinks,
  }) : _links = webLinks ?? const WebLinks();

  factory ThreadCommentModel.from(ThreadComment comment) {
    return switch (comment) {
      OtherUserThreadComment() => OtherUserThreadCommentModel(comment),
      CurrentUserThreadComment() => CurrentUserThreadCommentModel(comment),
    };
  }

  final WebLinks _links;

  ThreadComment get _comment;

  String get id => _comment.id;
  String? get postId => _comment.postId;
  String? get replyUrl => _comment.replyUrl;
  String? get onTitle => _comment.onTitle;

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
