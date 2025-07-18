import 'package:equatable/equatable.dart';
import 'package:feed_api/feed_api.dart';

sealed class FeedPageUrl extends Equatable {
  const FeedPageUrl();

  String get url;
}

final class InitialPageUrl extends FeedPageUrl {
  const InitialPageUrl(this.type);

  final FeedType type;

  @override
  String get url => switch (type) {
    FeedType.top => 'news',
    FeedType.newest => 'newest',
    FeedType.past => 'front',
    FeedType.ask => 'ask',
    FeedType.show => 'show',
    FeedType.jobs => 'jobs',
    FeedType.whoIsHiring => 'submitted?id=whoishiring',
  };

  @override
  List<Object> get props => [type];
}

final class NextPageUrl extends FeedPageUrl {
  const NextPageUrl({required this.url});

  @override
  final String url;

  @override
  List<Object> get props => [url];
}
