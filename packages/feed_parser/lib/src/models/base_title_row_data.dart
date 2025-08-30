import 'package:equatable/equatable.dart';

class BaseTitleRowData extends Equatable {
  const BaseTitleRowData({
    required this.id,
    required this.rank,
    required this.title,
    required this.url,
    required this.urlHost,
  });

  factory BaseTitleRowData.fromParsed({
    required String? id,
    required int? rank,
    required String? title,
    required String? url,
    required String? urlHost,
  }) {
    return BaseTitleRowData(
      id: id ?? '',
      rank: rank ?? 0,
      title: title ?? '',
      url: url ?? '',
      urlHost: urlHost,
    );
  }

  final String id;
  final int rank;
  final String title;
  final String url;
  final String? urlHost;

  @override
  List<Object?> get props => [
    id,
    rank,
    title,
    url,
    urlHost,
  ];
}
