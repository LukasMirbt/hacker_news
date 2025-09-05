part of 'thread_comment_model.dart';

class CurrentUserThreadCommentModel extends ThreadCommentModel {
  const CurrentUserThreadCommentModel(
    CurrentUserThreadComment comment, {
    super.webLinks,
  }) : _comment = comment;

  @override
  final CurrentUserThreadComment _comment;

  String? get editUrl => _comment.editUrl;
  String? get deleteUrl => _comment.deleteUrl;

  @override
  List<Object> get props => [
    _comment,
    ...super.props,
  ];
}
