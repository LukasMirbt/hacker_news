import 'package:equatable/equatable.dart';

class DetailTitleRowData extends Equatable {
  const DetailTitleRowData({
    required this.id,
    required this.title,
    required this.url,
    required this.upvoteUrl,
    required this.hasBeenUpvoted,
    required this.urlHost,
  });

  factory DetailTitleRowData.fromParsed({
    required String? id,
    required String? title,
    required String? url,
    required String? upvoteUrl,
    required bool? hasBeenUpvoted,
    required String? urlHost,
  }) {
    return DetailTitleRowData(
      id: id ?? '',
      title: title ?? '',
      url: url ?? '',
      upvoteUrl: upvoteUrl ?? '',
      hasBeenUpvoted: hasBeenUpvoted ?? false,
      urlHost: urlHost ?? '',
    );
  }

  static const empty = DetailTitleRowData(
    id: '',
    title: '',
    url: '',
    upvoteUrl: '',
    hasBeenUpvoted: false,
    urlHost: '',
  );

  final String id;
  final String title;
  final String url;
  final String upvoteUrl;
  final bool hasBeenUpvoted;
  final String urlHost;

  @override
  List<Object> get props => [
    id,
    title,
    url,
    upvoteUrl,
    hasBeenUpvoted,
    urlHost,
  ];
}
