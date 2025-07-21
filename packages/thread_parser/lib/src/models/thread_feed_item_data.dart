import 'package:equatable/equatable.dart';
import 'package:thread_parser/thread_parser.dart';

class ThreadFeedItemData extends Equatable {
  const ThreadFeedItemData({
    required this.id,
    required this.hnuser,
    required this.age,
    required this.htmlText,
    required this.indent,
    required this.score,
    required this.hasBeenUpvoted,
    required this.upvoteUrl,
    required this.parentUrl,
    required this.contextUrl,
    required this.onUrl,
    required this.replyUrl,
  });

  factory ThreadFeedItemData.fromParsed({
    required String? id,
    required Hnuser? hnuser,
    required DateTime? age,
    required String? htmlText,
    required int? indent,
    required int? score,
    required bool? hasBeenUpvoted,
    required String? upvoteUrl,
    required String? parentUrl,
    required String? contextUrl,
    required String? onUrl,
    required String? replyUrl,
  }) {
    return ThreadFeedItemData(
      id: id ?? '',
      hnuser: hnuser ?? Hnuser.empty,
      age: age ?? DateTime(0),
      htmlText: htmlText ?? '',
      indent: indent ?? 0,
      score: score,
      hasBeenUpvoted: hasBeenUpvoted,
      upvoteUrl: upvoteUrl,
      parentUrl: parentUrl,
      contextUrl: contextUrl,
      onUrl: onUrl,
      replyUrl: replyUrl,
    );
  }

  final String id;
  final Hnuser hnuser;
  final DateTime age;
  final String htmlText;
  final int indent;
  final int? score;
  final bool? hasBeenUpvoted;
  final String? upvoteUrl;
  final String? parentUrl;
  final String? contextUrl;
  final String? onUrl;
  final String? replyUrl;

  @override
  List<Object?> get props => [
    id,
    hnuser,
    age,
    htmlText,
    indent,
    score,
    hasBeenUpvoted,
    upvoteUrl,
    parentUrl,
    contextUrl,
    onUrl,
    replyUrl,
  ];
}
