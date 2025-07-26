import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:post_repository/post_repository.dart';

part 'post_state.freezed.dart';

@freezed
abstract class PostState with _$PostState {
  const factory PostState({
    required String id,
    required FetchStatus fetchStatus,
    required RefreshStatus refreshStatus,
  }) = _PostState;

  factory PostState.from({
    required String id,
    required PostRepository postRepository,
  }) {
    final repositoryState = postRepository.state;
    return PostState(
      id: id,
      fetchStatus: repositoryState.fetchStatus,
      refreshStatus: repositoryState.refreshStatus,
    );
  }
}
