// ignore_for_file: annotate_overrides

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reply_repository/reply_repository.dart';

part 'reply_page.freezed.dart';

@freezed
class ReplyPage with _$ReplyPage {
  const ReplyPage({
    required this.parent,
    required this.form,
  });

  factory ReplyPage.from(ReplyPageData data) {
    final parentData = data.parentData;
    final formData = data.formData;

    return ReplyPage(
      parent: ReplyParent.from(parentData),
      form: ReplyForm.from(formData),
    );
  }

  static final empty = ReplyPage(
    parent: ReplyParent.empty,
    form: ReplyForm.empty,
  );

  final ReplyParent parent;
  final ReplyForm form;
}
