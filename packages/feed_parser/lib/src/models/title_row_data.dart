import 'package:equatable/equatable.dart';
import 'package:feed_parser/feed_parser.dart';

part 'job_title_row_data.dart';
part 'post_title_row_data.dart';

sealed class TitleRowData extends Equatable {
  const TitleRowData({
    required this.base,
  });

  final BaseTitleRowData base;

  @override
  List<Object?> get props => [base];
}
