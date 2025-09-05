part of 'comment_model.dart';

class OtherUserCommentModel extends CommentModel {
  const OtherUserCommentModel(this._comment);

  @override
  final OtherUserComment _comment;

  @override
  List<Object> get props => [
    _comment,
    ...super.props,
  ];
}
