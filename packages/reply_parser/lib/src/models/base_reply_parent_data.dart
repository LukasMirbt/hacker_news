import 'package:equatable/equatable.dart';
import 'package:reply_parser/reply_parser.dart';

class BaseReplyParentData extends Equatable {
  const BaseReplyParentData({
    required this.id,
    required this.hnuser,
    required this.age,
    required this.htmlText,
  });

  factory BaseReplyParentData.fromParsed({
    required String? id,
    required Hnuser? hnuser,
    required DateTime? age,
    required String? htmlText,
  }) {
    return BaseReplyParentData(
      id: id ?? '',
      hnuser: hnuser ?? Hnuser.empty,
      age: age ?? DateTime(0),
      htmlText: htmlText ?? '',
    );
  }

  static final empty = BaseReplyParentData(
    id: '',
    hnuser: Hnuser.empty,
    age: DateTime(0),
    htmlText: '',
  );

  final String id;
  final Hnuser hnuser;
  final DateTime age;
  final String htmlText;

  @override
  List<Object?> get props => [
    id,
    hnuser,
    age,
    htmlText,
  ];
}
