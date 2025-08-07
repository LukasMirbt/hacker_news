import 'package:draft_storage/draft_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_draft.dart';
part 'draft.freezed.dart';
part 'reply_draft.dart';

sealed class Draft {
  const Draft();

  DateTime get createdAt;
  String get draft;
}
