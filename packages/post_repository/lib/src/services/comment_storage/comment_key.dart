import 'package:equatable/equatable.dart';

class CommentKey extends Equatable {
  const CommentKey({
    required this.postId,
    required this.userId,
  });

  final String postId;
  final String userId;

  String get value => '$postId:$userId';

  @override
  List<Object> get props => [
    postId,
    userId,
  ];
}
