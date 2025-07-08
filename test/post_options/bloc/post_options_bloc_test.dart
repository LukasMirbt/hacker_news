import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/post_options/post_options.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

class _MockPostRepository extends Mock implements PostRepository {}

void main() {
  final post = PostPlaceholder();

  group(PostOptionsBloc, () {
    late PostRepository postRepository;

    setUp(() {
      postRepository = _MockPostRepository();
      when(() => postRepository.state).thenReturn(post);
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
