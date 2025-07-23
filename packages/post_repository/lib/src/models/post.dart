// ignore_for_file: annotate_overrides

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:post_repository/post_repository.dart';

part 'post.freezed.dart';

@freezed
class Post with _$Post {
  const Post({
    required this.header,
    required this.commentForm,
    required this.comments,
  });

  factory Post.from(PostData data) {
    final fatItemData = data.fatItemData;
    final commentFormData = fatItemData.commentFormData;
    final comments = data.comments;

    return Post(
      header: PostHeader.from(fatItemData),
      commentForm: CommentForm.from(commentFormData),
      comments: [
        for (final item in comments) Comment.from(item),
      ],
    );
  }

  static final empty = Post(
    header: PostHeader.empty,
    commentForm: CommentForm.empty,
    comments: const [],
  );

  final PostHeader header;
  final CommentForm commentForm;
  final List<Comment> comments;
}
