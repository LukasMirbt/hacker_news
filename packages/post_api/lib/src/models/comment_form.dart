import 'package:equatable/equatable.dart';

class CommentForm extends Equatable {
  const CommentForm({
    required this.parent,
    required this.goto,
    required this.hmac,
    required this.text,
  });

  final String parent;
  final String goto;
  final String hmac;
  final String text;

  Map<String, String> toData() {
    return {
      'parent': parent,
      'goto': goto,
      'hmac': hmac,
      'text': text,
    };
  }

  @override
  List<Object?> get props => [
    parent,
    goto,
    hmac,
    text,
  ];
}
