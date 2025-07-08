import 'package:reply_form_parser/reply_form_parser.dart';

class ReplyFormTitleRowDataPlaceholder extends ReplyFormTitleRowData {
  ReplyFormTitleRowDataPlaceholder({
    String? id,
    Hnuser? hnuser,
    DateTime? age,
  }) : super(
         id: id ?? 'id',
         hnuser: hnuser ?? const HnuserPlaceholder(),
         age: age ?? DateTime(1),
       );
}
