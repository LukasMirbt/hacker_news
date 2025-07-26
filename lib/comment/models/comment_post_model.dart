import 'package:equatable/equatable.dart';
import 'package:post_repository/post_repository.dart';

class CommentPostModel extends Equatable {
  const CommentPostModel(this._post);

  final Post _post;

  String get title => _post.header.title;
  String? get htmlText => _post.header.htmlText;

  @override
  List<Object?> get props => [_post];
}
