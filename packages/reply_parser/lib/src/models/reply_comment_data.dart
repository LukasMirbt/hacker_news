import 'package:equatable/equatable.dart';
import 'package:reply_parser/reply_parser.dart';

class ReplyParentData extends Equatable {
  const ReplyParentData({
    required this.id,
    required this.upvoteUrl,
    required this.hasBeenUpvoted,
    required this.hnuser,
    required this.age,
    required this.htmlText,
  });

  factory ReplyParentData.fromParsed({
    required String? id,
    required String? upvoteUrl,
    required bool? hasBeenUpvoted,
    required Hnuser? hnuser,
    required DateTime? age,
    required String? htmlText,
  }) {
    return ReplyParentData(
      id: id ?? '',
      upvoteUrl: upvoteUrl ?? '',
      hasBeenUpvoted: hasBeenUpvoted ?? false,
      hnuser: hnuser ?? Hnuser.empty,
      age: age ?? DateTime(0),
      htmlText: htmlText ?? '',
    );
  }

  static final empty = ReplyParentData(
    id: '',
    upvoteUrl: '',
    hasBeenUpvoted: false,
    hnuser: Hnuser.empty,
    age: DateTime(0),
    htmlText: '',
  );

  final String id;
  final String upvoteUrl;
  final bool hasBeenUpvoted;
  final Hnuser hnuser;
  final DateTime age;
  final String htmlText;

  @override
  List<Object> get props => [
    id,
    upvoteUrl,
    hasBeenUpvoted,
    hnuser,
    age,
    htmlText,
  ];
}
