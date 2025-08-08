// ignore_for_file: annotate_overrides

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:post_repository/post_repository.dart';

part 'post_header.freezed.dart';

@freezed
class PostHeader with _$PostHeader {
  const PostHeader({
    required this.id,
    required this.title,
    required this.url,
    required this.upvoteUrl,
    required this.hasBeenUpvoted,
    required this.urlHost,
    required this.score,
    required this.hnuser,
    required this.age,
    required this.commentCount,
    required this.htmlText,
    required this.commentForm,
  });

  factory PostHeader.from({
    required DetailFatItemData data,
    required String? savedComment,
  }) {
    final titleRowData = data.titleRowData;
    final subtitleRowData = data.subtitleRowData;
    final commentFormData = data.commentFormData;

    CommentForm? commentForm;

    if (commentFormData != null) {
      commentForm = CommentForm.from(
        data: commentFormData,
        savedComment: savedComment,
      );
    }

    return PostHeader(
      id: titleRowData.id,
      title: titleRowData.title,
      url: titleRowData.url,
      upvoteUrl: titleRowData.upvoteUrl,
      hasBeenUpvoted: titleRowData.hasBeenUpvoted,
      urlHost: titleRowData.urlHost,
      score: subtitleRowData.score,
      hnuser: subtitleRowData.hnuser,
      age: subtitleRowData.age,
      commentCount: subtitleRowData.commentCount,
      htmlText: data.htmlText,
      commentForm: commentForm,
    );
  }

  static final empty = PostHeader(
    id: '',
    title: '',
    url: '',
    upvoteUrl: '',
    hasBeenUpvoted: false,
    urlHost: '',
    score: 0,
    hnuser: Hnuser.empty,
    age: DateTime(0),
    commentCount: 0,
    htmlText: null,
    commentForm: null,
  );

  final String id;
  final String title;
  final String url;
  final String? upvoteUrl;
  final bool hasBeenUpvoted;
  final String? urlHost;
  final int? score;
  final Hnuser? hnuser;
  final DateTime age;
  final int? commentCount;
  final String? htmlText;
  final CommentForm? commentForm;

  PostHeader upvote() {
    return copyWith(
      hasBeenUpvoted: true,
      score: (score ?? 0) + 1,
    );
  }

  PostHeader unvote() {
    return copyWith(
      hasBeenUpvoted: false,
      score: (score ?? 0) - 1,
    );
  }
}
