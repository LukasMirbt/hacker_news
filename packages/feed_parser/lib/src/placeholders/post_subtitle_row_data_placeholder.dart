import 'package:feed_parser/feed_parser.dart';

class PostSubtitleRowDataPlaceholder extends PostSubtitleRowData {
  PostSubtitleRowDataPlaceholder({
    int? score,
    Hnuser? hnuser,
    int? commentCount,
    DateTime? age,
  }) : super(
         score: score ?? 1,
         hnuser: hnuser ?? const HnuserPlaceholder(),
         commentCount: commentCount ?? 1,
         age: age ?? DateTime(1),
       );
}
