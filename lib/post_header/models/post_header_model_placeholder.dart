import 'package:hacker_client/post_header/post_header.dart';
import 'package:post_repository/post_repository.dart' as repository;

class PostHeaderModelPlaceholder extends PostHeaderModel {
  PostHeaderModelPlaceholder()
    : super(
        repository.PostHeaderPlaceholder(
          title: 'Lorem ipsum dolor sit amet',
          url: 'https://example.com',
          score: 100,
          commentCount: 100,
        ),
      );
}
