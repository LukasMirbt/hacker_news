// ignore_for_file: annotate_overrides

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:post_repository/post_repository.dart';

part 'post.freezed.dart';

@freezed
class Post with _$Post {
  const Post({
    required this.header,
    required this.comments,
  });

  factory Post.from(PostData data) {
    final fatItemData = data.fatItemData;
    final comments = data.comments;

    return Post(
      header: PostHeader.from(fatItemData),
      comments: [
        for (final item in comments) Comment.from(item),
      ],
    );
  }

  static final empty = Post(
    header: PostHeader.empty,
    comments: const [],
  );

  final PostHeader header;
  final List<Comment> comments;
}
