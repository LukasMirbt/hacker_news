import 'package:equatable/equatable.dart';
import 'package:post_parser/post_parser.dart';

part 'current_user_comment_data.dart';
part 'other_user_comment_data.dart';

sealed class CommentData extends Equatable {
  const CommentData({
    required this.base,
  });

  final BaseCommentData base;

  @override
  List<Object?> get props => [base];
}
