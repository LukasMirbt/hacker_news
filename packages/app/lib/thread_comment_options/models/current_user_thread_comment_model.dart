part of 'thread_comment_model.dart';

class CurrentUserThreadCommentModel extends ThreadCommentModel {
  const CurrentUserThreadCommentModel(
    CurrentUserThreadComment comment, {
    super.webLinks,
  }) : _comment = comment;

  @override
  final CurrentUserThreadComment _comment;

  Uri? get editUrl {
    final url = _comment.editUrl;
    if (url == null) return null;
    return _links.resolve(url);
  }

  Uri? get deleteUrl {
    final url = _comment.deleteUrl;
    if (url == null) return null;
    return _links.resolve(url);
  }

  @override
  List<Object> get props => [
    _comment,
    ...super.props,
  ];
}
