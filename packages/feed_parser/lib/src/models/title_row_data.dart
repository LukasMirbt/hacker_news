import 'package:equatable/equatable.dart';

class TitleRowData extends Equatable {
  const TitleRowData({
    required this.id,
    required this.rank,
    required this.title,
    required this.url,
    required this.urlHost,
    required this.upvoteUrl,
    required this.hasBeenUpvoted,
  });

  factory TitleRowData.fromParsed({
    required String? id,
    required int? rank,
    required String? title,
    required String? url,
    required String? urlHost,
    required String? upvoteUrl,
    required bool? hasBeenUpvoted,
  }) {
    return TitleRowData(
      id: id ?? '',
      rank: rank ?? 0,
      title: title ?? '',
      url: url ?? '',
      urlHost: urlHost,
      upvoteUrl: upvoteUrl,
      hasBeenUpvoted: hasBeenUpvoted ?? false,
    );
  }

  final String id;
  final int rank;
  final String title;
  final String url;
  final String? urlHost;
  final String? upvoteUrl;
  final bool hasBeenUpvoted;

  @override
  List<Object?> get props => [
    id,
    rank,
    title,
    url,
    urlHost,
    upvoteUrl,
    hasBeenUpvoted,
  ];
}
