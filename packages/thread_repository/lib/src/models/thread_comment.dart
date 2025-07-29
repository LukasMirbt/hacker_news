import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thread_repository/thread_repository.dart';

part 'current_user_thread_comment.dart';
part 'other_user_thread_comment.dart';
part 'thread_comment.freezed.dart';

sealed class ThreadComment {
  const ThreadComment();

  factory ThreadComment.from(ThreadCommentData data) {
    return switch (data) {
      final CurrentUserThreadCommentData data => CurrentUserThreadComment.from(
        data,
      ),
      final OtherUserThreadCommentData data => OtherUserThreadComment.from(
        data,
      ),
    };
  }

  String get id;
  int get indent;
  Hnuser get hnuser;
  DateTime get age;
  String get htmlText;
  String? get replyUrl;
  String? get parentUrl;
  String? get contextUrl;
  String? get onUrl;
  String? get onTitle;

  String? get postId {
    final onUrl = this.onUrl;
    if (onUrl == null) return null;

    final url = Uri.tryParse(onUrl);
    if (url == null) return null;

    return url.queryParameters['id'];
  }
}
