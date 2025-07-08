enum FeedType {
  top,
  newest,
  past,
  ask,
  show,
  jobs,
  whoIsHiring;

  String get endpoint => switch (this) {
    FeedType.top => 'news',
    FeedType.newest => 'newest',
    FeedType.past => 'front',
    FeedType.ask => 'ask',
    FeedType.show => 'show',
    FeedType.jobs => 'jobs',
    FeedType.whoIsHiring => 'submitted?id=whoishiring',
  };
}
