import 'package:equatable/equatable.dart';

class CommentStorageKey extends Equatable {
  const CommentStorageKey({
    required this.parentId,
    required this.userId,
  });

  final String parentId;
  final String userId;

  String get key => '$parentId:$userId';

  @override
  List<Object> get props => [
    parentId,
    userId,
  ];
}
