import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:post_repository/post_repository.dart';

part 'comment.freezed.dart';
part 'current_user_comment.dart';
part 'other_user_comment.dart';

sealed class Comment {
  const Comment();

  factory Comment.from(CommentData data) {
    return switch (data) {
      CurrentUserCommentData() => CurrentUserComment.from(data),
      OtherUserCommentData() => OtherUserComment.from(data),
    };
  }

  String get id;
  int get indent;
  Hnuser get hnuser;
  DateTime get age;
  String get htmlText;
  String? get replyUrl;
}
