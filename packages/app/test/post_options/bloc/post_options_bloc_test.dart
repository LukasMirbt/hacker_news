import 'package:app/post_options/post_options.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

class _MockPostRepository extends Mock implements PostRepository {}

class _MockPostRepositoryState extends Mock implements PostRepositoryState {}

void main() {
  final post = PostPlaceholder();

  group(PostOptionsBloc, () {
    late PostRepository postRepository;
    late PostRepositoryState repositoryState;

    setUp(() {
      postRepository = _MockPostRepository();
      repositoryState = _MockPostRepositoryState();
      when(() => postRepository.state).thenReturn(repositoryState);
      when(() => repositoryState.post).thenReturn(post);
    });

    PostOptionsBloc buildBloc() {
      return PostOptionsBloc(
        postRepository: postRepository,
      );
    }

    test('initial state is $PostOptionsState', () {
      expect(
        buildBloc().state,
        PostOptionsState.from(post),
      );
    });
  });
}
