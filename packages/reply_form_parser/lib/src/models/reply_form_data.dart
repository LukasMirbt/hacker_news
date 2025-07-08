import 'package:equatable/equatable.dart';
import 'package:reply_form_parser/reply_form_parser.dart';

class ReplyFormData extends Equatable {
  const ReplyFormData({
    required this.titleRowData,
    required this.htmlText,
    required this.hmac,
  });

  static final empty = ReplyFormData(
    titleRowData: ReplyFormTitleRowData.empty,
    htmlText: null,
    hmac: null,
  );

  final ReplyFormTitleRowData titleRowData;
  final String? htmlText;
  final String? hmac;

  @override
  List<Object?> get props => [
    titleRowData,
    htmlText,
    hmac,
  ];
}
