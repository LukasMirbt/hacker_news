import 'package:authentication_repository/authentication_repository.dart';
import 'package:hacker_client/thread_list/thread_list.dart';
import 'package:thread_repository/thread_repository.dart';

class ThreadListPlaceholder extends ThreadListModel {
  ThreadListPlaceholder()
    : super(
        repositoryList: PaginatedThreadList.initial(User.empty),
        items: List.filled(
          10,
          ThreadCommentModel(
            repositoryItem: ThreadCommentDataPlaceholder(
              age: DateTime(1),
              score: 10,
              hnuser: const HnuserPlaceholder(),
            ),
          ),
        ),
      );

  @override
  bool get isPlaceholder => true;

  @override
  bool get hasReachedMax => true;

  @override
  bool get isEmpty => false;

  @override
  PaginatedThreadList toRepository() => throw UnimplementedError();
}
