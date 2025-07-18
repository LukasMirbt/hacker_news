sealed class ThreadFeedPageUrl {
  const ThreadFeedPageUrl();

  String get url;
}

final class InitialPageUrl extends ThreadFeedPageUrl {
  const InitialPageUrl({required this.id});

  final String id;

  @override
  String get url {
    final url = Uri(
      path: 'threads',
      queryParameters: {'id': id},
    );
    return url.toString();
  }
}

final class NextPageUrl extends ThreadFeedPageUrl {
  const NextPageUrl({required this.url});

  @override
  final String url;
}
