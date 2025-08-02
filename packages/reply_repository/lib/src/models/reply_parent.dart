import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reply_repository/reply_repository.dart';

part 'current_user_reply_parent.dart';
part 'other_user_reply_parent.dart';
part 'reply_parent.freezed.dart';

sealed class ReplyParent {
  const ReplyParent();

  factory ReplyParent.from(ReplyParentData data) {
    return switch (data) {
      final CurrentUserReplyParentData data => CurrentUserReplyParent.from(
        data,
      ),
      final OtherUserReplyParentData data => OtherUserReplyParent.from(
        data,
      ),
    };
  }

  String get id;
  Hnuser get hnuser;
  DateTime get age;
  String get htmlText;
}
