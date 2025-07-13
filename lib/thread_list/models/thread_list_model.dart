import 'package:date_formatter/date_formatter.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hacker_client/thread_list/thread_list.dart';
import 'package:thread_repository/thread_repository.dart';

class ThreadListModel extends Equatable {
  @visibleForTesting
  const ThreadListModel({
    required this.items,
    required this.repositoryList,
  });

  factory ThreadListModel.fromRepository(PaginatedThreadList repositoryList) {
    return ThreadListModel(
      repositoryList: repositoryList,
      items: [
        for (final item in repositoryList.items)
          ThreadCommentModel(
            repositoryItem: item,
            formatter: const DateFormatter(),
          ),
      ],
    );
  }

  @visibleForTesting
  final PaginatedThreadList repositoryList;

  final List<ThreadCommentModel> items;

  bool get isPlaceholder => false;
  bool get hasReachedMax => repositoryList.hasReachedMax;
  bool get isEmpty => repositoryList.isEmpty;

  PaginatedThreadList toRepository() => repositoryList;

  @override
  List<Object?> get props => [
    repositoryList,
    items,
  ];
}
