import 'package:feed_repository/feed_repository.dart';

class JobFeedItemPlaceholder extends JobFeedItem {
  JobFeedItemPlaceholder({
    String? id,
    int? rank,
    String? title,
    String? url,
    String? urlHost,
    DateTime? age,
  }) : super(
         id: id ?? 'id',
         rank: rank ?? 1,
         title: title ?? 'title',
         url: url ?? 'url',
         urlHost: urlHost ?? 'urlHost',
         age: age ?? DateTime(1),
       );
}
