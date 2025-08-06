import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_draft.dart';
part 'draft.freezed.dart';
part 'reply_draft.dart';

sealed class Draft {
  const Draft();

  String get id;
  DateTime get createdAt;
  String get draft;
}
