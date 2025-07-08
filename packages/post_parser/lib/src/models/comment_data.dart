import 'package:equatable/equatable.dart';
import 'package:post_parser/post_parser.dart';

class CommentData extends Equatable {
  const CommentData({
    required this.id,
    required this.indent,
    required this.upvoteUrl,
    required this.hasBeenUpvoted,
    required this.hnuser,
    required this.age,
    required this.htmlText,
  });

  factory CommentData.fromParsed({
    required String? id,
    required int? indent,
    required String? upvoteUrl,
    required bool? hasBeenUpvoted,
    required Hnuser? hnuser,
    required DateTime? age,
    required String? htmlText,
  }) {
    return CommentData(
      id: id ?? '',
      indent: indent ?? 0,
      upvoteUrl: upvoteUrl ?? '',
      hasBeenUpvoted: hasBeenUpvoted ?? false,
      hnuser: hnuser ?? Hnuser.empty,
      age: age ?? DateTime(0),
      htmlText: htmlText ?? '',
    );
  }

  final String id;
  final int indent;
  final String upvoteUrl;
  final bool hasBeenUpvoted;
  final Hnuser hnuser;
  final DateTime age;
  final String htmlText;

  @override
  List<Object?> get props => [
    id,
    indent,
    upvoteUrl,
    hasBeenUpvoted,
    hnuser,
    age,
    htmlText,
  ];
}
