import 'package:feed_parser/feed_parser.dart';

class JobTitleRowDataPlaceholder extends JobTitleRowData {
  const JobTitleRowDataPlaceholder({
    BaseTitleRowData? base,
  }) : super(
         base: base ?? const BaseTitleRowDataPlaceholder(),
       );
}
