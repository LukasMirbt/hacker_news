import 'package:equatable/equatable.dart';
import 'package:post_parser/post_parser.dart';

class BaseCommentData extends Equatable {
  const BaseCommentData({
    required this.id,
    required this.indent,
    required this.hnuser,
    required this.age,
    required this.htmlText,
    required this.replyUrl,
  });

  factory BaseCommentData.fromParsed({
    required String? id,
    required int? indent,
    required Hnuser? hnuser,
    required DateTime? age,
    required String? htmlText,
    required String? replyUrl,
  }) {
    return BaseCommentData(
      id: id ?? '',
      indent: indent ?? 0,
      hnuser: hnuser ?? Hnuser.empty,
      age: age ?? DateTime(0),
      htmlText: htmlText ?? '',
      replyUrl: replyUrl,
    );
  }

  final String id;
  final int indent;
  final Hnuser hnuser;
  final DateTime age;
  final String htmlText;
  final String? replyUrl;

  @override
  List<Object?> get props => [
    id,
    indent,
    hnuser,
    age,
    htmlText,
    replyUrl,
  ];
}
