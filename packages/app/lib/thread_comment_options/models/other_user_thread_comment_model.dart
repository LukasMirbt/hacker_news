part of 'thread_comment_model.dart';

class OtherUserThreadCommentModel extends ThreadCommentModel {
  const OtherUserThreadCommentModel(
    OtherUserThreadComment comment, {
    super.webLinks,
  }) : _comment = comment;

  @override
  final OtherUserThreadComment _comment;

  @override
  List<Object> get props => [
    _comment,
    ...super.props,
  ];
}
