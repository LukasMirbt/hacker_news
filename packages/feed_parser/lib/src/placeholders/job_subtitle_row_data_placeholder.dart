import 'package:feed_parser/feed_parser.dart';

class JobSubtitleRowDataPlaceholder extends JobSubtitleRowData {
  JobSubtitleRowDataPlaceholder({
    DateTime? age,
  }) : super(
         age: age ?? DateTime(1),
       );
}
