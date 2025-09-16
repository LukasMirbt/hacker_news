import 'package:app/post/post.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

class _MockPostRepository extends Mock implements PostRepository {}

class _MockPostRepositoryState extends Mock implements PostRepositoryState {}

void main() {
  const id = 'id';
  const fetchStatus = FetchStatus.success;
  const refreshStatus = RefreshStatus.success;
  final post = PostPlaceholder();

  group(PostState, () {
    late PostRepository repository;
    late PostRepositoryState repositoryState;

    setUp(() {
      repository = _MockPostRepository();
      repositoryState = _MockPostRepositoryState();
      when(() => repository.state).thenReturn(repositoryState);
      when(() => repositoryState.fetchStatus).thenReturn(fetchStatus);
      when(() => repositoryState.refreshStatus).thenReturn(refreshStatus);
      when(() => repositoryState.post).thenReturn(post);
    });

    group('from', () {
      test('returns $PostState', () {
        expect(
          PostState.from(
            id: id,
            postRepository: repository,
          ),
          PostState(
            id: id,
            fetchStatus: fetchStatus,
            refreshStatus: refreshStatus,
            post: post,
          ),
        );
      });
    });
  });
}
