import 'package:hacker_client/thread_list/thread_list.dart';
import 'package:vote_repository/vote_repository.dart';

class ThreadListVoteModel {
  const ThreadListVoteModel();

  ThreadListModel updateThreadList({
    required Vote vote,
    required ThreadListModel threadList,
  }) {
    final item = threadList.findById(vote.id);
    if (item == null) return threadList;
    final updatedItem = item.vote(vote.type);
    final updatedFeed = threadList.update(updatedItem);
    return updatedFeed;
  }
}
