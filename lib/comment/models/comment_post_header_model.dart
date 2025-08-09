import 'package:equatable/equatable.dart';
import 'package:post_repository/post_repository.dart';

class CommentPostHeaderModel extends Equatable {
  const CommentPostHeaderModel(this._header);

  final PostHeader _header;

  String get id => _header.id;
  String get title => _header.title;
  String? get htmlText => _header.htmlText;

  PostHeader toRepository() => _header;

  @override
  List<Object?> get props => [_header];
}
