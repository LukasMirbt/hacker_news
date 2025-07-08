import 'package:equatable/equatable.dart';
import 'package:post_api/post_api.dart';

class ReplyForm extends Equatable {
  const ReplyForm({
    required this.id,
    required this.hnuser,
    required this.age,
    required this.htmlText,
    required this.hmac,
  });

  factory ReplyForm.from(ReplyFormData data) {
    final titleRowData = data.titleRowData;

    return ReplyForm(
      id: titleRowData.id,
      hnuser: titleRowData.hnuser,
      age: titleRowData.age,
      htmlText: data.htmlText,
      hmac: data.hmac,
    );
  }

  static final empty = ReplyForm(
    id: '',
    hnuser: Hnuser.empty,
    age: DateTime(0),
    htmlText: null,
    hmac: null,
  );

  final String id;
  final Hnuser hnuser;
  final DateTime age;
  final String? htmlText;
  final String? hmac;

  @override
  List<Object?> get props => [
    id,
    hnuser,
    age,
    htmlText,
    hmac,
  ];
}
