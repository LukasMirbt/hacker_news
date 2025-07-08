import 'package:post_parser/post_parser.dart';

class DetailTitleRowDataPlaceholder extends DetailTitleRowData {
  const DetailTitleRowDataPlaceholder({
    String? id,
    String? title,
    String? url,
    String? upvoteUrl,
    bool? hasBeenUpvoted,
    String? urlHost,
  }) : super(
         id: id ?? 'id',
         title: title ?? 'title',
         url: url ?? 'url',
         upvoteUrl: upvoteUrl ?? 'upvoteUrl',
         hasBeenUpvoted: hasBeenUpvoted ?? false,
         urlHost: urlHost ?? 'urlHost',
       );
}
