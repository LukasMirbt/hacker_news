import 'package:equatable/equatable.dart';

class ReplyFormData extends Equatable {
  const ReplyFormData({
    required this.parent,
    required this.goto,
    required this.hmac,
  });

  factory ReplyFormData.fromParsed({
    required String? parent,
    required String? goto,
    required String? hmac,
  }) {
    return ReplyFormData(
      parent: parent ?? '',
      goto: goto ?? '',
      hmac: hmac ?? '',
    );
  }

  static const empty = ReplyFormData(
    parent: '',
    goto: '',
    hmac: '',
  );

  final String parent;
  final String goto;
  final String hmac;

  @override
  List<Object> get props => [
    parent,
    goto,
    hmac,
  ];
}
