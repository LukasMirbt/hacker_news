import 'package:feed_parser/feed_parser.dart';

class BaseTitleRowDataPlaceholder extends BaseTitleRowData {
  const BaseTitleRowDataPlaceholder({
    String? id,
    int? rank,
    String? title,
    String? url,
    String? urlHost,
  }) : super(
         id: id ?? 'id',
         rank: rank ?? 1,
         title: title ?? 'title',
         url: url ?? 'url',
         urlHost: urlHost ?? 'urlHost',
       );
}
