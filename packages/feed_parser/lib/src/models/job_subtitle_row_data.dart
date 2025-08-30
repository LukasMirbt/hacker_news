part of 'subtitle_row_data.dart';

class JobSubtitleRowData extends SubtitleRowData {
  const JobSubtitleRowData({
    required super.age,
  });

  factory JobSubtitleRowData.fromParsed({
    required DateTime? age,
  }) {
    return JobSubtitleRowData(
      age: age ?? DateTime(0),
    );
  }

  static final empty = JobSubtitleRowData(
    age: DateTime(0),
  );
}
