import 'package:reply_parser/reply_parser.dart';

class BaseReplyParentDataPlaceholder extends BaseReplyParentData {
  BaseReplyParentDataPlaceholder({
    String? id,
    Hnuser? hnuser,
    DateTime? age,
    String? htmlText,
  }) : super(
         id: id ?? 'id',
         hnuser: hnuser ?? const HnuserPlaceholder(),
         age: age ?? DateTime(1),
         htmlText: htmlText ?? 'htmlText',
       );
}
