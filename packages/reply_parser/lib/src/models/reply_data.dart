import 'package:equatable/equatable.dart';
import 'package:reply_parser/reply_parser.dart';

class ReplyData extends Equatable {
  const ReplyData({
    required this.commentData,
    required this.formData,
  });

  static final empty = ReplyData(
    commentData: ReplyCommentData.empty,
    formData: ReplyFormData.empty,
  );

  final ReplyCommentData commentData;
  final ReplyFormData formData;

  @override
  List<Object?> get props => [
    commentData,
    formData,
  ];
}
