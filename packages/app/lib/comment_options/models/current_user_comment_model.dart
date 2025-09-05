part of 'comment_model.dart';

class CurrentUserCommentModel extends CommentModel {
  const CurrentUserCommentModel(
    this._comment, {
    super.webLinks,
  });

  @override
  final CurrentUserComment _comment;

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
