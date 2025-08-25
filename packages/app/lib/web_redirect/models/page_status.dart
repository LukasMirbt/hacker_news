import 'package:equatable/equatable.dart';

sealed class PageStatus extends Equatable {
  const PageStatus();

  int get progress;

  @override
  List<Object> get props => [];
}

final class PageInitial extends PageStatus {
  const PageInitial();

  @override
  int get progress => 0;
}

final class PageLoading extends PageStatus {
  const PageLoading([this.progress = 0]);

  @override
  final int progress;

  @override
  List<Object> get props => [progress];
}

final class PageSuccess extends PageStatus {
  const PageSuccess();

  @override
  int get progress => 100;
}

final class PageFailure extends PageStatus {
  const PageFailure();

  @override
  int get progress => 0;
}
