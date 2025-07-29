import 'package:equatable/equatable.dart';
import 'package:thread_parser/thread_parser.dart';

class ThreadFeedPageData extends Equatable {
  const ThreadFeedPageData({
    required this.comments,
    required this.moreLink,
  });

  final List<ThreadCommentData> comments;
  final String? moreLink;

  @override
  List<Object?> get props => [
    comments,
    moreLink,
  ];
}
