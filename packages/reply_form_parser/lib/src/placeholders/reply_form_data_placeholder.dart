import 'package:reply_form_parser/reply_form_parser.dart';

class ReplyFormDataPlaceholder extends ReplyFormData {
  ReplyFormDataPlaceholder({
    ReplyFormTitleRowData? titleRowData,
    super.htmlText,
    super.hmac,
  }) : super(
         titleRowData: titleRowData ?? ReplyFormTitleRowDataPlaceholder(),
       );
}
