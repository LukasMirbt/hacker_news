import 'package:equatable/equatable.dart';

class ReplyStorageKey extends Equatable {
  const ReplyStorageKey({
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
