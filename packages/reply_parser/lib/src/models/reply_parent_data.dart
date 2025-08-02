import 'package:equatable/equatable.dart';
import 'package:reply_parser/reply_parser.dart';

part 'current_user_reply_parent_data.dart';
part 'other_user_reply_parent_data.dart';

sealed class ReplyParentData extends Equatable {
  const ReplyParentData({
    required this.base,
  });

  final BaseReplyParentData base;

  @override
  List<Object?> get props => [base];
}
