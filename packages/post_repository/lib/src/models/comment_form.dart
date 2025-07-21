// ignore_for_file: annotate_overrides

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:post_api/post_api.dart' as api;
import 'package:post_repository/post_repository.dart';

part 'comment_form.freezed.dart';

@freezed
class CommentForm with _$CommentForm {
  const CommentForm({
    required this.parent,
    required this.goto,
    required this.hmac,
    this.text = '',
  });

  factory CommentForm.from(DetailCommentFormData data) {
    return CommentForm(
      parent: data.parent,
      goto: data.goto,
      hmac: data.hmac,
    );
  }

  api.CommentForm toApi() {
    return api.CommentForm(
      parent: parent,
      goto: goto,
      hmac: hmac,
      text: text,
    );
  }

  static const empty = CommentForm(
    parent: '',
    goto: '',
    hmac: '',
  );

  final String parent;
  final String goto;
  final String hmac;
  final String text;
}
