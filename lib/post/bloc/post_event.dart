import 'package:equatable/equatable.dart';

sealed class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

final class PostSubscriptionRequested extends PostEvent {
  const PostSubscriptionRequested();
}

final class PostStarted extends PostEvent {
  const PostStarted();
}

final class PostRefreshTriggered extends PostEvent {
  const PostRefreshTriggered();
}
