import 'package:equatable/equatable.dart';
import 'package:post_parser/post_parser.dart';

class DetailFatItemData extends Equatable {
  const DetailFatItemData({
    required this.titleRowData,
    required this.subtitleRowData,
    required this.htmlText,
    required this.hmac,
  });

  static final empty = DetailFatItemData(
    titleRowData: DetailTitleRowData.empty,
    subtitleRowData: DetailSubtitleRowData.empty,
    htmlText: null,
    hmac: null,
  );

  final DetailTitleRowData titleRowData;
  final DetailSubtitleRowData subtitleRowData;
  final String? htmlText;
  final String? hmac;

  @override
  List<Object?> get props => [
    titleRowData,
    subtitleRowData,
    htmlText,
    hmac,
  ];
}
