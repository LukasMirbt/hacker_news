// ignore_for_file: annotate_overrides

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:post_repository/post_repository.dart';

part 'post_repository_state.freezed.dart';

enum FetchStatus {
  loading,
  success,
  failure;

  bool get isLoading => this == loading;
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
class PostRepositoryState with _$PostRepositoryState {
  PostRepositoryState({
    this.fetchStatus = FetchStatus.loading,
    this.refreshStatus = RefreshStatus.initial,
    Post? post,
  }) : post = post ?? Post.empty;

  final FetchStatus fetchStatus;
  final RefreshStatus refreshStatus;
  final Post post;
}
