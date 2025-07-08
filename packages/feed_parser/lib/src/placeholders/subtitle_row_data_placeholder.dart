import 'package:feed_parser/feed_parser.dart';

class SubtitleRowDataPlaceholder extends SubtitleRowData {
  SubtitleRowDataPlaceholder({
    DateTime? age,
    int? score,
    Hnuser? hnuser,
    int? commentCount,
  }) : super(
         age: age ?? DateTime(1),
         score: score ?? 1,
         hnuser: hnuser ?? const HnuserPlaceholder(),
         commentCount: commentCount ?? 1,
       );
}
