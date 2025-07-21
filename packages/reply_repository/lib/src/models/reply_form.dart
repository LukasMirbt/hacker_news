// ignore_for_file: annotate_overrides

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reply_api/reply_api.dart' as api;
import 'package:reply_api/reply_api.dart' hide ReplyForm;

part 'reply_form.freezed.dart';

@freezed
class ReplyForm with _$ReplyForm {
  const ReplyForm({
    required this.hnuser,
    required this.age,
    required this.htmlText,
    required this.parent,
    required this.goto,
    required this.hmac,
    this.text = '',
  });

  factory ReplyForm.from(api.ReplyData data) {
    final commentData = data.commentData;
    final formData = data.formData;

    return ReplyForm(
      hnuser: commentData.hnuser,
      age: commentData.age,
      htmlText: commentData.htmlText,
      parent: formData.parent,
      goto: formData.goto,
      hmac: formData.hmac,
    );
  }

  api.ReplyForm toApi() {
    return api.ReplyForm(
      parent: parent,
      goto: goto,
      hmac: hmac,
      text: text,
    );
  }

  static final empty = ReplyForm(
    hnuser: Hnuser.empty,
    age: DateTime(0),
    htmlText: '',
    parent: '',
    goto: '',
    hmac: '',
  );

  final Hnuser hnuser;
  final DateTime age;
  final String htmlText;
  final String parent;
  final String goto;
  final String hmac;
  final String text;
}
