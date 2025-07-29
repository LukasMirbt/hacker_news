import 'package:equatable/equatable.dart';
import 'package:thread_parser/thread_parser.dart';

class BaseThreadCommentData extends Equatable {
  const BaseThreadCommentData({
    required this.id,
    required this.indent,
    required this.hnuser,
    required this.age,
    required this.htmlText,
    required this.replyUrl,
    required this.parentUrl,
    required this.contextUrl,
    required this.onUrl,
    required this.onTitle,
  });

  factory BaseThreadCommentData.fromParsed({
    required String? id,
    required int? indent,
    required Hnuser? hnuser,
    required DateTime? age,
    required String? htmlText,
    required String? replyUrl,
    required String? parentUrl,
    required String? contextUrl,
    required String? onUrl,
    required String? onTitle,
  }) {
    return BaseThreadCommentData(
      id: id ?? '',
      indent: indent ?? 0,
      hnuser: hnuser ?? Hnuser.empty,
      age: age ?? DateTime(0),
      htmlText: htmlText ?? '',
      replyUrl: replyUrl,
      parentUrl: parentUrl,
      contextUrl: contextUrl,
      onUrl: onUrl,
      onTitle: onTitle,
    );
  }

  final String id;
  final int indent;
  final Hnuser hnuser;
  final DateTime age;
  final String htmlText;
  final String? replyUrl;
  final String? parentUrl;
  final String? contextUrl;
  final String? onUrl;
  final String? onTitle;

  @override
  List<Object?> get props => [
    id,
    indent,
    hnuser,
    age,
    htmlText,
    replyUrl,
    parentUrl,
    contextUrl,
    onUrl,
    onTitle,
  ];
}
