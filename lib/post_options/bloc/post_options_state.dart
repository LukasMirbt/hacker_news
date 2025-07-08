import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hacker_client/post_options/post_options.dart';
import 'package:post_repository/post_repository.dart';

part 'post_options_state.freezed.dart';

@freezed
abstract class PostOptionsState with _$PostOptionsState {
  const factory PostOptionsState({
    required PostModel post,
  }) = _PostOptionsState;

  factory PostOptionsState.from(Post post) {
    return PostOptionsState(
      post: PostModel(post),
    );
  }
}
