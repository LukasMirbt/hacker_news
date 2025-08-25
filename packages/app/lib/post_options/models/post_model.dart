import 'package:app/external_links/external_links.dart';
import 'package:equatable/equatable.dart';
import 'package:post_repository/post_repository.dart';

class PostModel extends Equatable {
  const PostModel(this._post);

  final Post _post;

  String get webUrl {
    final id = _post.header.id;
    return hackerNewsItemLink(id: id);
  }

  @override
  List<Object> get props => [_post];
}
