part of 'title_row_data.dart';

class PostTitleRowData extends TitleRowData {
  const PostTitleRowData({
    required this.upvoteUrl,
    required this.hasBeenUpvoted,
    required super.base,
  });

  factory PostTitleRowData.fromParsed({
    required BaseTitleRowData base,
    required String? upvoteUrl,
    required bool? hasBeenUpvoted,
  }) {
    return PostTitleRowData(
      base: base,
      upvoteUrl: upvoteUrl,
      hasBeenUpvoted: hasBeenUpvoted ?? false,
    );
  }

  final String? upvoteUrl;
  final bool hasBeenUpvoted;

  @override
  List<Object?> get props => [
    upvoteUrl,
    hasBeenUpvoted,
    ...super.props,
  ];
}
