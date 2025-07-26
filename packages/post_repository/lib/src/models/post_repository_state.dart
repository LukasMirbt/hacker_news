import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:post_repository/post_repository.dart';

part 'post_repository_state.freezed.dart';

enum FetchStatus {
  loading,
  success,
  failure;

  bool get isLoading => this == loading;
  bool get isSuccess => this == success;
  bool get isFailure => this == failure;
}

enum RefreshStatus {
  initial,
  loading,
  success,
  failure;

  bool get isLoading => this == loading;
}

@freezed
abstract class PostRepositoryState with _$PostRepositoryState {
  const factory PostRepositoryState({
    required Post post,
    @Default(FetchStatus.loading) FetchStatus fetchStatus,
    @Default(RefreshStatus.initial) RefreshStatus refreshStatus,
  }) = _PostRepositoryState;

  factory PostRepositoryState.initial() {
    return PostRepositoryState(post: Post.empty);
  }
}
