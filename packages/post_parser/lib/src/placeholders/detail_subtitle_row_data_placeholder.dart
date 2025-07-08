import 'package:post_parser/post_parser.dart';

class DetailSubtitleRowDataPlaceholder extends DetailSubtitleRowData {
  DetailSubtitleRowDataPlaceholder({
    int? score,
    Hnuser? hnuser,
    DateTime? age,
    int? commentCount,
  }) : super(
         score: score ?? 1,
         hnuser: hnuser ?? const HnuserPlaceholder(),
         age: age ?? DateTime(1),
         commentCount: commentCount ?? 1,
       );
}
