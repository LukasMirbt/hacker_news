import 'package:feed_parser/feed_parser.dart';

class TitleRowDataPlaceholder extends TitleRowData {
  const TitleRowDataPlaceholder({
    String? id,
    int? rank,
    String? title,
    String? url,
    String? urlHost,
    String? upvoteUrl,
    bool? hasBeenUpvoted,
  }) : super(
         id: id ?? 'id',
         rank: rank ?? 1,
         title: title ?? 'title',
         url: url ?? 'url',
         urlHost: urlHost ?? 'urlHost',
         upvoteUrl: upvoteUrl ?? 'upvoteUrl',
         hasBeenUpvoted: hasBeenUpvoted ?? false,
       );
}
