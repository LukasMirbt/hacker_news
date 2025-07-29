import 'package:equatable/equatable.dart';
import 'package:thread_parser/thread_parser.dart';

part 'current_user_thread_comment_data.dart';
part 'other_user_thread_comment_data.dart';

sealed class ThreadCommentData extends Equatable {
  const ThreadCommentData({
    required this.base,
  });

  final BaseThreadCommentData base;

  @override
  List<Object?> get props => [base];
}
