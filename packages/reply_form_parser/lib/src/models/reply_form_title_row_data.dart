import 'package:equatable/equatable.dart';
import 'package:reply_form_parser/reply_form_parser.dart';

class ReplyFormTitleRowData extends Equatable {
  const ReplyFormTitleRowData({
    required this.id,
    required this.hnuser,
    required this.age,
  });

  factory ReplyFormTitleRowData.fromParsed({
    required String? id,
    required Hnuser? hnuser,
    required DateTime? age,
  }) {
    return ReplyFormTitleRowData(
      id: id ?? '',
      hnuser: hnuser ?? Hnuser.empty,
      age: age ?? DateTime(0),
    );
  }

  static final empty = ReplyFormTitleRowData(
    id: '',
    hnuser: Hnuser.empty,
    age: DateTime(0),
  );

  final String id;
  final Hnuser hnuser;
  final DateTime age;

  @override
  List<Object> get props => [
    id,
    hnuser,
    age,
  ];
}
