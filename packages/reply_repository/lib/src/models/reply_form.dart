// ignore_for_file: annotate_overrides

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reply_api/reply_api.dart' as api;
import 'package:reply_repository/reply_repository.dart';

part 'reply_form.freezed.dart';

@freezed
class ReplyForm with _$ReplyForm {
  const ReplyForm({
    required this.parentId,
    required this.goto,
    required this.hmac,
    this.text = '',
  });

  factory ReplyForm.from(ReplyFormData data) {
    return ReplyForm(
      parentId: data.parent,
      goto: data.goto,
      hmac: data.hmac,
    );
  }

  api.ReplyForm toApi() {
    return api.ReplyForm(
      parent: parentId,
      goto: goto,
      hmac: hmac,
      text: text,
    );
  }

  static const empty = ReplyForm(
    parentId: '',
    goto: '',
    hmac: '',
  );

  final String parentId;
  final String goto;
  final String hmac;
  final String text;
}
