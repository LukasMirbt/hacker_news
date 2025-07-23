import 'package:equatable/equatable.dart';

class DetailCommentFormData extends Equatable {
  const DetailCommentFormData({
    required this.parent,
    required this.goto,
    required this.hmac,
  });

  factory DetailCommentFormData.fromParsed({
    required String? parent,
    required String? goto,
    required String? hmac,
  }) {
    return DetailCommentFormData(
      parent: parent ?? '',
      goto: goto ?? '',
      hmac: hmac ?? '',
    );
  }

  static const empty = DetailCommentFormData(
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
