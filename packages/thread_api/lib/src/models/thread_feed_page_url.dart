import 'package:equatable/equatable.dart';

sealed class ThreadFeedPageUrl extends Equatable {
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

  @override
  List<Object> get props => [id];
}

final class NextPageUrl extends ThreadFeedPageUrl {
  const NextPageUrl({required this.url});

  @override
  final String url;

  @override
  List<Object> get props => [url];
}
