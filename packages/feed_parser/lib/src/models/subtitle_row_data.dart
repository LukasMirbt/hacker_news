import 'package:equatable/equatable.dart';
import 'package:feed_parser/feed_parser.dart';

part 'job_subtitle_row_data.dart';
part 'post_subtitle_row_data.dart';

sealed class SubtitleRowData extends Equatable {
  const SubtitleRowData({
    required this.age,
  });

  final DateTime age;

  @override
  List<Object?> get props => [age];
}
