import 'package:app/post_header/post_header.dart';
import 'package:post_repository/post_repository.dart' as repository;
import 'package:post_repository/post_repository.dart';

class PostHeaderModelPlaceholder extends PostHeaderModel {
  PostHeaderModelPlaceholder()
    : super(
        repository.PostHeaderPlaceholder(
          title: 'Lorem ipsum dolor sit amet consectetur',
          url: 'https://example.com',
          urlHost: 'example.com',
          hnuser: const HnuserPlaceholder(
            id: 'Lorem',
          ),
          score: 100,
          commentCount: 100,
        ).copyWith(
          htmlText: null,
        ),
      );

  @override
  bool get isPlaceholder => true;
}
