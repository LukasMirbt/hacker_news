// ignore_for_file: annotate_overrides

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:post_api/post_api.dart' as api;
import 'package:post_repository/post_repository.dart';

part 'comment_form.freezed.dart';

@freezed
class CommentForm with _$CommentForm {
  const CommentForm({
    required this.parentId,
    required this.goto,
    required this.hmac,
    this.text = '',
  });

  factory CommentForm.from(DetailCommentFormData data) {
    return CommentForm(
      parentId: data.parent,
      goto: data.goto,
      hmac: data.hmac,
    );
  }

  api.CommentForm toApi() {
    return api.CommentForm(
      parent: parentId,
      goto: goto,
      hmac: hmac,
      text: text,
    );
  }

  static const empty = CommentForm(
    parentId: '',
    goto: '',
    hmac: '',
  );

  final String parentId;
  final String goto;
  final String hmac;
  final String text;
}
